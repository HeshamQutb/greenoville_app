import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.height,
  });
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        right: right ?? 0,
        left: left ?? 0,
      ),
      child: Container(
        width: double.infinity,
        color: Colors.grey[350],
        height: height ?? 1.0,
      ),
    );
  }
}
