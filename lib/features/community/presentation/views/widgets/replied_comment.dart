import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import 'replied_comment_bottom_section.dart';
import 'replied_comment_content_section.dart';

class RepliedComment extends StatelessWidget {
  const RepliedComment({
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
            InkWell(
              onTap: (){
                navigateTo(
                  context,
                  comment.uId == uId
                      ? AccountView(appCubit: appCubit,)
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
                    appCubit: appCubit,
                    post: post,
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
