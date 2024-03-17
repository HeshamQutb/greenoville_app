import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.type,
    this.capitalization,
    required this.validate,
    this.onChanged,
    this.onFieldSubmitted,
    required this.label,
    this.prefixIcon,
    this.suffix,
    this.onPressedSuffix,
    this.isPassword,
    this.radius = 30.0,
    this.length,
    this.focusNode,
  });

  final TextEditingController? controller;
  final TextInputType? type;
  final FocusNode? focusNode;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffix;
  final Function()? onPressedSuffix;
  final bool? isPassword;
  final double radius;
  final int? length;
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
        prefixIcon: Icon(prefixIcon),
        label: Text(label),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius)
        ),
        suffixIcon: IconButton(
          onPressed: onPressedSuffix,
          icon: Icon(suffix),
        ),
      ),
      maxLength: length,
    );
  }
}
