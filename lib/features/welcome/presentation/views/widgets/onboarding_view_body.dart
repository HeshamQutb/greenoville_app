import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/welcome/presentation/view_model/onboarding_view_cubit/onboarding_view_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../view_model/onboarding_view_cubit/onboarding_view_state.dart';
import 'onboarding_view_text.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/agricultural-workers.jpg',
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.agriculture,
                    color: Colors.white,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const OnBoardingViewText(), // Increased spacing
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                    function: () {
                      OnBoardingCubit.get(context).getStartedSubmitted(context);
                    },
                    text: 'Get Started',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
