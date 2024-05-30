import 'package:flutter/material.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'replies_list_view_item.dart';

class RepliesListView extends StatelessWidget {
  const RepliesListView({
    super.key,
    required this.replies,
    required this.post,
    required this.comment,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  final List<CommunityCommentModel> replies;
  final CommunityCommentModel comment;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final replay = replies[index];
          return RepliesListViewItem(
            post: post,
            replay: replay,
            comment: comment,
            communityCubit: communityCubit,
          );
        },
        childCount: replies.length,
      ),
    );
  }
}
