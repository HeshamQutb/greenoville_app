import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view_item.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';

class PostCommentsListView extends StatelessWidget {
  const PostCommentsListView({
    super.key,
    required this.comments,
    required this.appCubit,
    required this.post,
  });
  final AppCubit appCubit;
  final CommunityPostModel post;
  final List<CommunityCommentModel> comments;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final comment = comments[index];
          return PostCommentsListViewItem(
            appCubit: appCubit,
            post: post,
            comment: comment,
          );
        },
        childCount: comments.length,
      ),
    );
  }
}