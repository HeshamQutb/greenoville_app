import 'package:flutter/material.dart';

import '../../../../../core/widgets/gradient_text.dart';

class LoginTextSection extends StatelessWidget {
  const LoginTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientText(
          text: 'LOGIN',
          colors: [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
        ),
        GradientText(
          text: 'Enter Your Email and Password',
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