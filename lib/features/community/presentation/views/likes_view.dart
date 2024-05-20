import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/likes_view_body.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/community_post_model.dart';

class LikesView extends StatelessWidget {
  const LikesView({super.key, required this.appCubit, required this.post});
  final AppCubit appCubit;
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
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: LikesViewBody(
          appCubit: appCubit,
          post: post,
        ),
      ),
    );
  }
}
