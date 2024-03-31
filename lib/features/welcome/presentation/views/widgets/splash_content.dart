import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';

class AnimatedSplashScreenContent extends StatelessWidget {
  const AnimatedSplashScreenContent({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: LottieBuilder.asset(
            'assets/lottie/splash.json',
          ),
        ),
        GradientText(
          text: S.of(context).appName,
          colors: const [Colors.green, Colors.blue],
          left: 0.0,
          top: 0.0,
          width: 500.0,
          height: 70.0,
        )
      ],
    );
  }
}
