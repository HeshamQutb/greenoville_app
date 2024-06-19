import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/community_post_model.dart';
import '../view_model/community_cubit/community_cubit.dart';
import '../view_model/community_cubit/community_states.dart';
import 'widgets/community_view_body.dart';
import 'widgets/community_view_custom_app_bar.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  late Future<List<CommunityPostModel>> future;

  @override
  void initState() {
    super.initState();
    future = CommunityCubit.get(context).getPosts();
  }

  Future<void> refreshPosts() async {
    setState(() {
      future = CommunityCubit.get(context).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityCubit, CommunityStates>(
      listener: (context, state) {
        if (state is DeletePostSuccessState) {
          showToast(
            message: S.of(context).successfullyDeletePost,
            state: ToastState.success,
          );
          refreshPosts();
        }
      },
      builder: (context, state) {
        var communityCubit = CommunityCubit.get(context);
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CommunityViewCustomAppBar(),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refreshPosts,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      CommunityViewBody(
                        communityCubit: communityCubit,
                        future: future,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
