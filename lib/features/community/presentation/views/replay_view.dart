import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/replay_view_body.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/community_comment_model.dart';
import '../../data/models/community_post_model.dart';
import '../view_model/community_cubit/community_cubit.dart';

class ReplayView extends StatelessWidget {
  const ReplayView({
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
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        leadingAction: () {
          Navigator.pop(context);
        },
        title: S.of(context).replies,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ReplayViewBody(
          autofocus: autofocus,
          post: post,
          comment: comment,
          communityCubit: communityCubit,
        ),
      ),
    );
  }
}
