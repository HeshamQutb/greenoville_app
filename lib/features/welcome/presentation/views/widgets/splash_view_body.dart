import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/welcome/presentation/views/widgets/splash_content.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/app_cubit/app_states.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedSplashScreen(
          splash: const AnimatedSplashScreenContent(),
          nextScreen: AppCubit.get(context).getNextScreen(),
          splashIconSize: 500,
          pageTransitionType: PageTransitionType.bottomToTop,
        );
      },
    );
  }
}
