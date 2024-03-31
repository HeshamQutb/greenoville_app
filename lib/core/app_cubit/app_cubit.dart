import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/soils/presentation/views/soils_view.dart';
import '../../features/welcome/presentation/views/onboarding_view.dart';
import '../../views/community_view.dart';
import '../../views/learn_view.dart';
import '../../views/market_view.dart';
import '../network/local/cache_helper.dart';
import '../services/navigate_services.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  void getAppLanguage(){
    appLanguage = CacheHelper.getData(key: 'appLanguage');
  }

  Widget getSplashNextScreen() {
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
    const SoilsView(),
    const CommunityView(),
    const LearnView(),
    const MarketView(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  final PageController pageController = PageController();
  void setPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeInOut,
    );
  }

  bool isArabic(){
    return Intl.getCurrentLocale() == 'ar';
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'uId').then((value) {
      if (value) {
        navigateAndFinish(context, const LoginView());
      }
      emit(AppSignOutState());
    });
  }





}
