// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/community/presentation/views/community_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/soils/presentation/views/soils_view.dart';
import '../../features/welcome/presentation/views/onboarding_view.dart';
import '../../views/learn_view.dart';
import '../../views/market_view.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);


  bool isArabic(){
    return Intl.getCurrentLocale() == 'ar';
  }

  void selectLanguage(String selectedLanguage){
    CacheHelper.setData(
      key: 'appLanguage',
      value: selectedLanguage,
    ).then((value) {
      print(selectedLanguage);
      emit(SelectLanguageState(selectedLanguage));
    });
  }

  String? getAppLanguage(){
    appLanguage = CacheHelper.getData(key: 'appLanguage');
    return appLanguage;
  }


  UserModel? userModel;
  // Get User Data
  void getUserData() async {
    if (uId != null) {
      emit(AppGetUserLoadingState());

      try {
        final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .get();

        if (snapshot.exists) {
          var userData = snapshot.data();
          print(uId);
          print(userData);

          userModel = UserModel.fromJson(userData!);
          emit(AppGetUserSuccessState());
        } else {
          emit(AppGetUserErrorState("User data not found"));
        }
      } catch (error) {
        print("Error fetching user data: $error");
        emit(AppGetUserErrorState(error.toString()));
      }
    } else {
      emit(AppGetUserNullState("User ID is null"));
    }
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








}
