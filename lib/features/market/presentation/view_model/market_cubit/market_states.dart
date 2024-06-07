import 'package:greenoville_app/features/market/data/market_farm_model.dart';

import 'package:greenoville_app/features/market/data/product_model.dart';

abstract class MarketStates {}

class MarketInitState extends MarketStates {}

// Get Farms states
class MarketGetFarmLoadingState extends MarketStates {}

class MarketGetFarmSuccessState extends MarketStates {
  List<MarketFarmModel> farms;
  MarketGetFarmSuccessState(this.farms);
}

class MarketGetFarmErrorState extends MarketStates {
  final String error;

  MarketGetFarmErrorState(this.error);
}


// Get Farms states
class MarketGetFarmProductsLoadingState extends MarketStates {}

class MarketGetFarmProductsSuccessState extends MarketStates {
  List<ProductModel> products;
  MarketGetFarmProductsSuccessState(this.products);
}

class MarketGetFarmProductsEmptyState extends MarketStates {
  List<ProductModel> products;
  MarketGetFarmProductsEmptyState(this.products);
}

class MarketGetFarmProductsErrorState extends MarketStates {
  final String error;

  MarketGetFarmProductsErrorState(this.error);
}