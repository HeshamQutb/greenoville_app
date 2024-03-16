import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.visualDensity,
    this.size,
    this.isUpperCase,
  });

  final void Function()? onPressed;
  final String text;
  final bool? isUpperCase;
  final VisualDensity? visualDensity;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(fixedSize: const Size.fromHeight(0.0)),
      onPressed: onPressed,
      child: Text(
        isUpperCase ?? true == true ? text.toUpperCase() : text,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
