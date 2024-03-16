import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/widgets/gradient_text.dart';

class AnimatedSplashScreenContent extends StatelessWidget {
  const AnimatedSplashScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: LottieBuilder.asset(
            'assets/lottie/splash.json',
          ),
        ),
        const GradientText(
          text: 'GreeNoville',
          colors: [Colors.green, Colors.blue],
          left: 0.0,
          top: 0.0,
          width: 500.0,
          height: 20.0,
        )
      ],
    );
  }
}