import 'package:flutter/material.dart';

import '../../constants.dart';
import 'gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leadingAction,
    this.centerTitle,
    this.fontSize,
  });

  final String? title;
  final Function()? leadingAction;
  final bool? centerTitle;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      titleSpacing: 0.0,
      leading: leadingAction != null
          ? IconButton(
              onPressed: leadingAction,
              icon: const Icon(
                Icons.arrow_back_ios,
                color:
                    kPrimaryColor, // Assuming kPrimaryColor is defined somewhere
              ),
            )
          : null,
      title: GradientText(
        fontSize: fontSize ?? 23,
        text: title ?? '',
        colors: const [Colors.green, Colors.blue],
        left: 0.0,
        top: 0.0,
        width: 500.0,
        height: 70.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
