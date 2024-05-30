import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view_item.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class PostCommentsListView extends StatelessWidget {
  const PostCommentsListView({
    super.key,
    required this.comments,
    required this.post,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  final List<CommunityCommentModel> comments;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final comment = comments[index];
          return PostCommentsListViewItem(
            post: post,
            comment: comment,
            communityCubit: communityCubit,
          );
        },
        childCount: comments.length,
      ),
    );
  }
}
