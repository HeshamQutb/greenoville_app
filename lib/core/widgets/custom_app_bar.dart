import 'package:flutter/material.dart';

import '../../constants.dart';
import 'gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? leadingAction;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        fontSize: 23,
        text: title,
        colors: const [Colors.green, Colors.blue],
        left: 0.0,
        top: 0.0,
        width: 300.0,
        height: 70.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}