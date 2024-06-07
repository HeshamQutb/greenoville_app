
abstract class AppStates {}

class AppInitState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeNavBarState extends AppStates {}

class AppSignOutState extends AppStates {}

class SelectLanguageState extends AppStates {
  final String language;

  SelectLanguageState(this.language);
}

// Get User Data States
class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppGetUserNullState extends AppStates {
  final String error;

  AppGetUserNullState(this.error);
}



