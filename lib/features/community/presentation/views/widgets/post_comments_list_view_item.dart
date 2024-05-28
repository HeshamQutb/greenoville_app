import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/community/presentation/views/replay_view.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
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
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: StreamBuilder<List<CommunityCommentModel>>(
                stream: context.read<AppCubit>().getReplies(
                      postId: post.postId,
                      commentId: comment.commentId,
                    ),
                builder: (context, snapshot) {
                  int repliesCount = snapshot.data?.length ?? 0;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      if(repliesCount > 0)
                        InkWell(
                        onTap: () {
                          navigateTo(
                            context,
                            ReplayView(
                              appCubit: appCubit,
                              post: post,
                              comment: comment,
                            ),
                          );
                        },
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '$repliesCount ${S.of(context).replay}',
                            style: const TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
