import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

import '../../../../community/data/models/community_post_model.dart';
import '../../../../market/data/market_farm_model.dart';

abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

// Get User Data States
class ProfileGetUserLoadingState extends ProfileStates {}

class ProfileGetUserSuccessState extends ProfileStates {}

class ProfileGetUserErrorState extends ProfileStates {
  final String error;

  ProfileGetUserErrorState(this.error);
}

class ProfileGetUserNullState extends ProfileStates {
  final String error;

  ProfileGetUserNullState(this.error);
}


// Get Post states
class ProfileGetPostLoadingState extends ProfileStates {}

class ProfileGetPostSuccessState extends ProfileStates {
  List<CommunityPostModel> posts;
  ProfileGetPostSuccessState(this.posts);
}

class ProfileGetPostErrorState extends ProfileStates {
  final String error;

  ProfileGetPostErrorState(this.error);
}


// Get Farms states
class ProfileGetFarmLoadingState extends ProfileStates {}

class ProfileGetFarmSuccessState extends ProfileStates {
  List<MarketFarmModel> posts;
  ProfileGetFarmSuccessState(this.posts);
}

class ProfileGetFarmErrorState extends ProfileStates {
  final String error;

  ProfileGetFarmErrorState(this.error);
}


// Get Tips states
class ProfileGetTipsLoadingState extends ProfileStates {}

class ProfileGetTipsSuccessState extends ProfileStates {
  List<TipsModel> posts;
  ProfileGetTipsSuccessState(this.posts);
}

class ProfileGetTipsErrorState extends ProfileStates {
  final String error;

  ProfileGetTipsErrorState(this.error);
}