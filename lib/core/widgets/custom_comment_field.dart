import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';

import '../app_cubit/app_cubit.dart';
import '../utils/icon_broken.dart';
import 'custom_text_field.dart';

class CustomCommentField extends StatelessWidget {
  const CustomCommentField({
    super.key,
    required this.commentController,
    required this.appCubit,
    this.autofocus,
    required this.onPressedSuffix,
    required this.hintText,
  });
  final AppCubit appCubit;
  final TextEditingController commentController;
  final bool? autofocus;
  final String hintText;
  final Function() onPressedSuffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomTextField(
        suffixColor: kPrimaryColor,
        controller: commentController,
        hintText: hintText,
        suffixIcon: IconBroken.Send,
        validator: (String? value) {
          return value.toString();
        },
        onPressedSuffix: onPressedSuffix,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        autofocus: autofocus ?? true,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
