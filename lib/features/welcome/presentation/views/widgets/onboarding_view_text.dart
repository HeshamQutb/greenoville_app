import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class OnBoardingViewText extends StatelessWidget {
  const OnBoardingViewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).welcomeTo,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          S.of(context).appName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ), // Increased spacing
        Text(
          S.of(context).onBoardingText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15, // Increased font size for better readability
            fontStyle: FontStyle.italic, // Added italic style
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
