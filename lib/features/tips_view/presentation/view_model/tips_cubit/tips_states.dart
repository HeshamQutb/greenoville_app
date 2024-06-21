import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

abstract class TipsStates {}

class TipsInitState extends TipsStates {}

// Get Tips states
class GetTipsLoadingState extends TipsStates {}

class GetTipsSuccessState extends TipsStates {
  List<TipsModel> posts;
  GetTipsSuccessState(this.posts);
}

class GetTipsErrorState extends TipsStates {
  final String error;

  GetTipsErrorState(this.error);
}

