import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_comment_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'replied_comment.dart';
import 'replies_list_view_builder.dart';

class ReplayViewBody extends StatelessWidget {
  const ReplayViewBody({
    super.key,
    required this.post,
    required this.comment,
    this.autofocus,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  final CommunityCommentModel comment;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    var replayController = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: RepliedComment(
                  post: post,
                  comment: comment,
                  communityCubit: communityCubit,
                ),
              ),
              RepliesListViewBuilder(
                post: post,
                comment: comment,
                communityCubit: communityCubit,
              ),
            ],
          ),
        ),
        CustomCommentField(
          autofocus: autofocus,
          commentController: replayController,
          onPressedSuffix: () {
            communityCubit.replayToComment(
              postId: post.postId,
              content: replayController.text,
              commentId: comment.commentId,
            );
            replayController.clear();
            FocusScope.of(context).unfocus();
          },
          hintText: S.of(context).writeAReplay,
        )
      ],
    );
  }
}
