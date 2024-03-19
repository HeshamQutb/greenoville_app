import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';

import '../../constants.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/welcome/presentation/views/onboarding_view.dart';
import '../../views/community_view.dart';
import '../../views/learn_view.dart';
import '../../views/market_view.dart';
import '../../views/soil_view.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  Widget getNextScreen(){
    uId = CacheHelper.getData(key: 'uId');

    if (CacheHelper.getData(key: 'onBoarding') != null) {
      if (uId != null) {
        return const RootView();
      } else {
        return const LoginView();
      }
    } else {
      return const OnBoardingView();
    }
  }


  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SoilView(),
    const CommunityView(),
    const LearnView(),
    const MarketView(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }



}
