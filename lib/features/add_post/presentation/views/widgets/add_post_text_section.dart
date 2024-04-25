import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class AddPostTextSection extends StatelessWidget {
  const AddPostTextSection({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        hintText: S.of(context).whatIsYourMind,
        border: InputBorder.none,
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      autofocus: false,
      textAlignVertical: TextAlignVertical.top,
    );
  }
}
