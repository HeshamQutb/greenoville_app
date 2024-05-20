import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/replies_list_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';

class RepliesListViewBuilder extends StatelessWidget {
  const RepliesListViewBuilder({
    super.key,
    required this.appCubit,
    required this.post,
    required this.comment,
  });

  final AppCubit appCubit;
  final CommunityPostModel post;
  final CommunityCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityCommentModel>>(
      stream: appCubit.getReplies(
        postId: post.postId,
        commentId: comment.commentId,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('${S.of(context).error} ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(S.of(context).noReplies),
            ),
          );
        } else {
          final replies = snapshot.data!;
          return RepliesListView(
            replies: replies,
            appCubit: appCubit,
            post: post,
            comment: comment,
          );
        }
      },
    );
  }
}
