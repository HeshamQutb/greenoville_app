import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/welcome/presentation/view_model/onboarding_view_cubit/onboarding_view_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/onboarding_view_cubit/onboarding_view_state.dart';
import 'onboarding_view_text.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcOver,
              ),
              fit: BoxFit.cover,
              image: const AssetImage(
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
                  onPressed: () {
                    OnBoardingCubit.get(context).getStartedSubmitted(context);
                  },
                  text: S.of(context).getStarted,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
