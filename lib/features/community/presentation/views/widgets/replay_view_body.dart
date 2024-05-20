import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_comment_field.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import 'replied_comment.dart';
import 'replies_list_view_builder.dart';

class ReplayViewBody extends StatelessWidget {
  const ReplayViewBody({
    super.key,
    required this.appCubit,
    required this.post,
    required this.comment,
    this.autofocus,
  });
  final AppCubit appCubit;
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
                  appCubit: appCubit,
                  post: post,
                  comment: comment,
                ),
              ),
              RepliesListViewBuilder(
                appCubit: appCubit,
                post: post,
                comment: comment,
              ),
            ],
          ),
        ),
        CustomCommentField(
          autofocus: autofocus,
          commentController: replayController,
          appCubit: appCubit,
          onPressedSuffix: () {
            appCubit.replayToComment(
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
