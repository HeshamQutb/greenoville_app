import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import 'replies_list_view_item.dart';

class RepliesListView extends StatelessWidget {
  const RepliesListView({
    super.key,
    required this.replies,
    required this.appCubit,
    required this.post,
    required this.comment,
  });
  final AppCubit appCubit;
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
            appCubit: appCubit,
            post: post,
            replay: replay,
            comment: comment,
          );
        },
        childCount: replies.length,
      ),
    );
  }
}
