import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });
  final IconData leadingIcon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 30,
        ),
        title: Text(
          title,
        ),
      ),
    );
  }
}