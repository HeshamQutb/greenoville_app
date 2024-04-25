import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/post_view_body.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/community_post_model.dart';

class PostView extends StatelessWidget {
  const PostView({super.key, required this.appCubit, required this.post, this.autofocus});
  final AppCubit appCubit;
  final CommunityPostModel post;
  final bool? autofocus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        leadingAction: () {
          Navigator.pop(context);
        },
        title: appCubit.isArabic()
            ? '${S.of(context).itsPost} ${post.userName.split(' ').first}'
            : '${post.userName.split(' ').first}\'s ${S.of(context).itsPost}',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: PostViewBody(
          autofocus: autofocus,
          appCubit: appCubit,
          post: post,
        ),
      ),
    );
  }
}
