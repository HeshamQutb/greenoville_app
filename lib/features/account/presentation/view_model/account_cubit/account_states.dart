import 'package:greenoville_app/features/market/data/market_farm_model.dart';

import '../../../../community/data/models/community_post_model.dart';

abstract class AccountStates {}

class AccountInitState extends AccountStates {}

// Get User Data States
class AccountGetUserLoadingState extends AccountStates {}

class AccountGetUserSuccessState extends AccountStates {}

class AccountGetUserErrorState extends AccountStates {
  final String error;

  AccountGetUserErrorState(this.error);
}

class AccountGetUserNullState extends AccountStates {
  final String error;

  AccountGetUserNullState(this.error);
}


// Get Post states
class AccountGetPostLoadingState extends AccountStates {}

class AccountGetPostSuccessState extends AccountStates {
  List<CommunityPostModel> posts;
  AccountGetPostSuccessState(this.posts);
}

class AccountGetPostErrorState extends AccountStates {
  final String error;

  AccountGetPostErrorState(this.error);
}


// Get Farms states
class AccountGetFarmLoadingState extends AccountStates {}

class AccountGetFarmSuccessState extends AccountStates {
  List<MarketFarmModel> posts;
  AccountGetFarmSuccessState(this.posts);
}

class AccountGetFarmErrorState extends AccountStates {
  final String error;

  AccountGetFarmErrorState(this.error);
}