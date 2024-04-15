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
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return AnimatedSplashScreen(
          splash: AnimatedSplashScreenContent(
            appCubit: appCubit,
          ),
          nextScreen: AppCubit.get(context).getSplashNextScreen(),
          splashIconSize: 500,
          pageTransitionType: PageTransitionType.bottomToTop,
        );
      },
    );
  }
}
