import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/profile/presentation/view_model/profile_cubit/profile_states.dart';
import 'package:greenoville_app/features/profile/presentation/views/widgets/profile_view_builder.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../community/data/models/community_post_model.dart';
import '../view_model/profile_cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.uId,
  });
  final String uId;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Future<UserModel> futureUser;
  late Future<List<CommunityPostModel>> futurePosts;
  late Future<List<TipsModel>> futureTips;
  @override
  void initState() {
    super.initState();
    futureUser = ProfileCubit.get(context)
        .getUserData(context: context, uId: widget.uId);
    futurePosts = ProfileCubit.get(context).getPosts(uId: widget.uId);
    futureTips = ProfileCubit.get(context).getTips(uid: widget.uId);
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            leadingAction: () {
              Navigator.pop(context);
            },
          ),
          body: ProfileViewBuilder(
            futureUser: futureUser,
            tabController: tabController,
            futurePosts: futurePosts,
            futureTips: futureTips,
          ),
        );
      },
    );
  }
}
