import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/network/local/cache_helper.dart';
import 'app_states.dart';


class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitState());
  static LanguageCubit get(context) => BlocProvider.of(context);

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

}
