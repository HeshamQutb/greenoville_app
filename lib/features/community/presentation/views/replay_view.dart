import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/replay_view_body.dart';
import '../../data/models/community_comment_model.dart';
import '../../data/models/community_post_model.dart';

class ReplayView extends StatelessWidget {
  const ReplayView({
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
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        leadingAction: () {
          Navigator.pop(context);
        },
        title: 'Replies',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ReplayViewBody(
          autofocus: autofocus,
          appCubit: appCubit,
          post: post,
          comment: comment,
        ),
      ),
    );
  }
}
