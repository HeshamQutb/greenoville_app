import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';

class PostCommentField extends StatelessWidget {
  const PostCommentField(
      {super.key,
      required this.commentController,
      required this.appCubit,
      required this.post,
      this.autofocus});
  final AppCubit appCubit;
  final TextEditingController commentController;
  final CommunityPostModel post;
  final bool? autofocus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomTextField(
        suffixColor: kPrimaryColor,
        controller: commentController,
        hintText: S.of(context).writeAComment,
        suffixIcon: IconBroken.Send,
        validator: (String? value) {
          return value.toString();
        },
        onPressedSuffix: () {
          appCubit.commentOnPost(
            postId: post.postId,
            content: commentController.text,
          );
          commentController.clear();
          FocusScope.of(context).unfocus();
        },
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        autofocus: autofocus ?? true,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
