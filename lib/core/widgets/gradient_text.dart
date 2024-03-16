import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.colors,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
    this.fontSize,
  });
  final String text;
  final List<Color> colors;
  final double left;
  final double top;
  final double width;
  final double height;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        foreground: Paint()
          ..shader = LinearGradient(
            colors: colors,
          ).createShader(
            Rect.fromLTWH(left, top, width, height),
          ),
        fontSize: fontSize ?? 50,
      ),
    );
  }
}
