import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class PostCommentsListViewBuilder extends StatelessWidget {
  const PostCommentsListViewBuilder({
    super.key,
    required this.post,
    required this.communityCubit,
  });

  final CommunityCubit communityCubit;
  final CommunityPostModel post;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityCommentModel>>(
      stream: communityCubit.getComments(postId: post.postId),
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
            post: post,
            communityCubit: communityCubit,
          );
        }
      },
    );
  }
}
