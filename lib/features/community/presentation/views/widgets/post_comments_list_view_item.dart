import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import 'comment_item_bottom_section.dart';
import 'comment_item_content_section.dart';

class PostCommentsListViewItem extends StatelessWidget {
  const PostCommentsListViewItem({
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                comment.userImage,
              ),
              radius: 25,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                children: [
                  CommentItemContentSection(
                    appCubit: appCubit,
                    post: post,
                    comment: comment,
                  ),
                  CommentItemBottomSection(
                    appCubit: appCubit,
                    post: post,
                    comment: comment,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}




