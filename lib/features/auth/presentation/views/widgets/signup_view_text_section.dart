import 'package:flutter/material.dart';

import '../../../../../core/widgets/gradient_text.dart';

class SignUpViewTextSection extends StatelessWidget {
  const SignUpViewTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GradientText(
          text: 'Sign Up',
          colors: [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
        ),
        SizedBox(
          height: 15.0,
        ),
        GradientText(
          text: 'Join GreeNoville Community',
          colors: [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: 14,
        ),
        GradientText(
          text: 'Discover Sustainable Farming Practices!',
          colors: [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: 14,
        ),
      ],
    );
  }
}