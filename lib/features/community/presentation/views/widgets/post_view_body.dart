import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_bottom_section.dart';
import 'package:greenoville_app/core/widgets/custom_comment_field.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_comments_list_view_builder.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_heading_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_image_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_like_and_comments_section.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_text_section.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody({
    super.key,
    required this.post,
    this.autofocus,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
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
                      communityCubit: communityCubit,
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
                      communityCubit: communityCubit,
                    ),
                    const CustomDivider(
                      bottom: 10,
                    ),
                    PostBottomSection(
                      post: post,
                      communityCubit: communityCubit,
                    ),
                    const CustomDivider(
                      top: 10,
                      bottom: 30,
                    ),
                  ],
                ),
              ),
              PostCommentsListViewBuilder(
                post: post,
                communityCubit: communityCubit,
              ),
            ],
          ),
        ),
        CustomCommentField(
          autofocus: autofocus,
          commentController: commentController,
          onPressedSuffix: () {
            communityCubit.commentOnPost(
              postId: post.postId,
              content: commentController.text,
            );
            commentController.clear();
            FocusScope.of(context).unfocus();
          },
          hintText: S.of(context).writeAComment,
        )
      ],
    );
  }
}
