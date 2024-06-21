abstract class AddTipsStates {}

class AddTipsInitialState extends AddTipsStates {}

// Add Tips
class AddTipsLoadingState extends AddTipsStates {}

class AddTipsSuccessState extends AddTipsStates {}

class AddTipsErrorState extends AddTipsStates {
  final String error;
  AddTipsErrorState(this.error);
}

