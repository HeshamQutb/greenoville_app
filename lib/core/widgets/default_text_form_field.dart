import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.type,
    this.capitalization,
    required this.validate,
    this.onChanged,
    this.onFieldSubmitted,
    this.label,
    this.hintText,
    this.prefixIcon,
    this.suffix,
    this.onPressedSuffix,
    this.isPassword,
    this.radius = 30.0,
    this.length,
    this.focusNode,
    this.maxLines,
    this.helperText,
  });

  final TextEditingController? controller;
  final TextInputType? type;
  final FocusNode? focusNode;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? label;
  final String? hintText;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffix;
  final Function()? onPressedSuffix;
  final bool? isPassword;
  final double radius;
  final int? length;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: isPassword == true ? true : false,
      keyboardType: type,
      textCapitalization: capitalization ?? TextCapitalization.none,
      validator: validate,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        label: Text(
          label ?? '',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onPressedSuffix,
          icon: Icon(
            suffix,
          ),
        ),
        helperText: helperText ?? '',
        helperStyle: const TextStyle(
          height: 0.0
        )
      ),
      maxLength: length,
      maxLines: maxLines ?? 1,
    );
  }
}
