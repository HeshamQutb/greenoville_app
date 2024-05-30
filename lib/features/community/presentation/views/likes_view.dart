import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/community/presentation/view_model/community_cubit/community_cubit.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/likes_view_body.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/community_post_model.dart';

class LikesView extends StatelessWidget {
  const LikesView({
    super.key,
    required this.post,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingAction: () {
          Navigator.pop(context);
        },
        title: S.of(context).peopleWhoReacted,
        fontSize: 18,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: LikesViewBody(
          post: post,
          communityCubit: communityCubit,
        ),
      ),
    );
  }
}
