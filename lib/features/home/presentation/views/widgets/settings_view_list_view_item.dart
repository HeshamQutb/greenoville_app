import 'package:flutter/material.dart';

class SettingsViewItem extends StatelessWidget {
  const SettingsViewItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailing,
  });
  final IconData leadingIcon;
  final String title;
  final Function() trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 30,
      ),
      title: Text(
        title,
      ),
      trailing: IconButton(
        onPressed: trailing,
        icon: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}