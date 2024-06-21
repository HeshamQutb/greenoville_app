import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/account/presentation/view_model/account_cubit/account_states.dart';
import 'package:greenoville_app/features/account/presentation/views/widgets/account_view_builder.dart';
import 'package:greenoville_app/features/auth/data/models/user_model.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import '../../../community/data/models/community_post_model.dart';
import '../../../edit_profile/presentation/views/edit_profile_view.dart';
import '../view_model/account_cubit/account_cubit.dart';

class AccountView extends StatefulWidget {
  const AccountView({
    super.key,
  });
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Future<UserModel> futureUser;
  late Future<List<CommunityPostModel>> futurePosts;
  late Future<List<TipsModel>> futureTips;

  @override
  void initState() {
    super.initState();
    futureUser = AccountCubit.get(context).getUserData(context: context);
    futurePosts = AccountCubit.get(context).getPosts(uid: uId);
    futureTips = AccountCubit.get(context).getTips(uid: uId);
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void navigateToEditProfile(UserModel userModel) async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileView(userModel: userModel),
      ),
    );
    if (updatedUser != null) {
      setState(() {
        futureUser = Future.value(updatedUser);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            leadingAction: () {
              Navigator.pop(context);
            },
          ),
          body: AccountViewBuilder(
            futureUser: futureUser,
            tabController: tabController,
            futurePosts: futurePosts,
            onEditProfile: navigateToEditProfile,
            futureTips: futureTips,
          ),
        );
      },
    );
  }
}
