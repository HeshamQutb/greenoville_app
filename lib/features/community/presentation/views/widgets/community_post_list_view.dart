import 'package:flutter/material.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'community_post_list_view_item.dart';

class CommunityListView extends StatelessWidget {
  const CommunityListView({
    super.key,
    required this.posts,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final List<CommunityPostModel> posts;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CommunityPostListViewItem(
            communityCubit: communityCubit,
            post: posts[index],
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
