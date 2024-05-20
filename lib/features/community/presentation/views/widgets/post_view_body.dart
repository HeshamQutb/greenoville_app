import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_bottom_section.dart';
import 'package:greenoville_app/core/widgets/custom_comment_field.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view_builder.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_heading_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_image_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_like_and_comments_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_text_section.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody(
      {super.key, required this.appCubit, required this.post, this.autofocus});
  final AppCubit appCubit;
  final CommunityPostModel post;
  final bool? autofocus;
  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostHeadingSection(
                        post: post,
                      ),
                      const CustomDivider(
                        top: 12,
                        bottom: 12,
                      ),
                      if (post.description != '')
                        PostTextSection(
                          post: post,
                        ),
                      if (post.postImage != '')
                        PostImageSection(
                          post: post,
                        ),
                      PostLikesAndCommentsSection(
                        post: post,
                        appCubit: appCubit,
                      ),
                      const CustomDivider(
                        bottom: 10,
                      ),
                      PostBottomSection(
                        appCubit: appCubit,
                        post: post,
                      ),
                      const CustomDivider(
                        top: 10,
                        bottom: 30,
                      ),
                    ],
                  ),
                ),
                PostCommentsListViewBuilder(
                  appCubit: appCubit,
                  post: post,
                ),
              ]),
        ),
        CustomCommentField(
          autofocus: autofocus,
          commentController: commentController,
          appCubit: appCubit,
          onPressedSuffix: () {
            appCubit.commentOnPost(
              postId: post.postId,
              content: commentController.text,
            );
            commentController.clear();
            FocusScope.of(context).unfocus();
          }, hintText: S.of(context).writeAComment,
        )
      ],
    );
  }
}
