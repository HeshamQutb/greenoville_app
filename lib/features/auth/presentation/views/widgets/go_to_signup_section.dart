import 'package:flutter/material.dart';

import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../register_view.dart';

class GoToSignUp extends StatelessWidget {
  const GoToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account !',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        DefaultTextButton(
          onPressed: () {
            navigateTo(context, const RegisterView());
          },
          text: 'signup',
        ),
      ],
    );
  }
}