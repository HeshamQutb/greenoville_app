import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';

class PostCommentsListViewBuilder extends StatelessWidget {
  const PostCommentsListViewBuilder({super.key, required this.appCubit, required this.post});

  final AppCubit appCubit;
  final CommunityPostModel post;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityCommentModel>>(
      stream: appCubit.getComments(postId: post.postId),
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
              child: Text(S.of(context).noComments),
            ),
          );
        } else {
          final comments = snapshot.data!;
          return PostCommentsListView(
            comments: comments,
            appCubit: appCubit,
            post: post,
          );
        }
      },
    );
  }
}


