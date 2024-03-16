import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.icon,
    this.function,
    required this.text,
    this.radius,
    this.fontSize,
    this.width,
    this.background,
    this.buttonTextColor,
    this.isUpperCase,
  });
  final double? width;
  final Color? background;
  final IconData? icon;
  final void Function()? function;
  final String text;
  final Color? buttonTextColor;
  final bool? isUpperCase;
  final double? radius;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: background ?? Colors.green,
          borderRadius: BorderRadius.circular(radius ?? 16)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ?? true == true ? text.toUpperCase() : text,
          style: TextStyle(
              color: buttonTextColor ?? Colors.white, fontSize: fontSize ?? 18),
        ),
      ),
    );
  }
}
