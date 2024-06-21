import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

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

// Get Farm states
class AccountGetFarmLoadingState extends AccountStates {}

class AccountGetFarmSuccessState extends AccountStates {}

class AccountGetFarmErrorState extends AccountStates {
  final String error;

  AccountGetFarmErrorState(this.error);
}

// Get Farm Products states
class AccountGetFarmProductsLoadingState extends AccountStates {}

class AccountGetFarmProductsSuccessState extends AccountStates {}

class AccountGetFarmProductsEmptyState extends AccountStates {
  List<ProductModel> products;
  AccountGetFarmProductsEmptyState(this.products);
}

class AccountGetFarmProductsErrorState extends AccountStates {
  final String error;

  AccountGetFarmProductsErrorState(this.error);
}



// Get Tips states
class AccountGetTipsLoadingState extends AccountStates {}

class AccountGetTipsSuccessState extends AccountStates {
  List<TipsModel> posts;
  AccountGetTipsSuccessState(this.posts);
}

class AccountGetTipsErrorState extends AccountStates {
  final String error;

  AccountGetTipsErrorState(this.error);
}