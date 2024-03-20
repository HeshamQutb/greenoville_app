import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/views/login_view.dart';

import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../core/services/navigate_services.dart';
import 'onboarding_view_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  void getStartedSubmitted(context) {
    CacheHelper.setData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          const LoginView(),
        );
      }
      emit(OnBoardingGetStartSubmittedState());
    });
  }
}
