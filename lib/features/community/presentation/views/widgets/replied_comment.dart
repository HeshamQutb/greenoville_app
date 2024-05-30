import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'replied_comment_bottom_section.dart';
import 'replied_comment_content_section.dart';

class RepliedComment extends StatelessWidget {
  const RepliedComment({
    super.key,
    required this.post,
    required this.comment,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
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
            InkWell(
              onTap: () {
                navigateTo(
                  context,
                  comment.uId == uId
                      ? const AccountView()
                      : ProfileView(
                          post: post,
                        ),
                );
              },
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  comment.userImage,
                ),
                radius: 25,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                children: [
                  RepliedCommentContentSection(
                    comment: comment,
                  ),
                  RepliedCommentBottomSection(
                    comment: comment,
                    post: post,
                    communityCubit: communityCubit,
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
