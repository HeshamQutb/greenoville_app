
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/welcome/presentation/view_model/onboarding_view_cubit/onboarding_view_cubit.dart';
import 'package:greenoville_app/features/welcome/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: const Scaffold(
        body: OnBoardingViewBody(),
      ),
    );
  }
}
