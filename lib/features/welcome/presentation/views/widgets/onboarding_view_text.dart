import 'package:flutter/material.dart';

class OnBoardingViewText extends StatelessWidget {
  const OnBoardingViewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to',
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
          'GreeNoville',
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
          'Empower Your Harvest, Empower Your Future',
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
