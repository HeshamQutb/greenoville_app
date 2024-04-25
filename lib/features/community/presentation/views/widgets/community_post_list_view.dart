import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../data/models/community_post_model.dart';
import 'community_post_list_view_item.dart';

class CommunityListView extends StatelessWidget {
  const CommunityListView({
    super.key,
    required this.posts,
    required this.appCubit,
  });
  final AppCubit appCubit;
  final List<CommunityPostModel> posts;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CommunityPostListViewItem(
            appCubit: appCubit,
            post: posts[index],
          );
        },
        childCount: posts.length,
      ),
    );

  }
}
