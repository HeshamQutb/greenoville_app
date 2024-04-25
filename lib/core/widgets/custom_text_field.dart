import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.textAlignVertical,
    this.onPressedSuffix,
    this.suffixColor,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData suffixIcon;
  final String Function(String?) validator;
  final void Function(String?)? onFieldSubmitted;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final TextAlignVertical? textAlignVertical;
  final Function()? onPressedSuffix;
  final Color? suffixColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxLines != null && maxLines! > 1
                ? 10
                : (5 *
                            (Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .fontSize ??
                                14) +
                        16)
                    .toDouble(),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            autofocus: autofocus,
            textAlignVertical:
                maxLines == null || maxLines == 1 ? null : textAlignVertical,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              suffixIcon: IconButton(
                color: suffixColor,
                onPressed: onPressedSuffix,
                icon: Icon(suffixIcon),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
