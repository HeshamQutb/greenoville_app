import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/community/data/models/community_post_model.dart';
import '../../../../../core/widgets/custom_divider.dart';
import 'community_post_bottom_section.dart';
import 'community_post_heading_section.dart';
import 'community_post_image_section.dart';
import 'community_post_like_and_comments_section.dart';
import 'community_post_text_section.dart';

class CommunityPostListViewItem extends StatelessWidget {
  const CommunityPostListViewItem({
    super.key,
    required this.appCubit,
    required this.post,
  });
  final AppCubit appCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommunityPostHeadingSection(
              post: post,
            ),
            const CustomDivider(
              top: 12,
              bottom: 12,
            ),
            if (post.description != '')
              CommunityPostTextSection(
                post: post,
              ),
            if (post.postImage != '')
              CommunityPostImageSection(
                post: post,
              ),
            CommunityPostLikesAndCommentsSection(
              post: post,
              appCubit: appCubit,
            ),
            const CustomDivider(
              bottom: 10,
            ),
            CommunityPostBottomSection(
              appCubit: appCubit,
              post: post,
            ),
          ],
        ),
      ),
    );
  }
}
