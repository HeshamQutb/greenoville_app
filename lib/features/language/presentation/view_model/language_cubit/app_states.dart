abstract class LanguageStates {}

class LanguageInitState extends LanguageStates {}


class SelectLanguageState extends LanguageStates {
  final String language;

  SelectLanguageState(this.language);
}


