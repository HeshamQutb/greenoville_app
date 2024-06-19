import 'package:greenoville_app/features/market_prices/data/product_model.dart';


abstract class FarmStates {}

class FarmInitState extends FarmStates {}

// Get Farms states
class FarmGetFarmLoadingState extends FarmStates {}

class FarmGetFarmSuccessState extends FarmStates {}

class FarmGetFarmErrorState extends FarmStates {
  final String error;

  FarmGetFarmErrorState(this.error);
}

// Get Farms Products states
class FarmGetFarmProductsLoadingState extends FarmStates {}

class FarmGetFarmProductsSuccessState extends FarmStates {
  List<ProductModel> products;
  FarmGetFarmProductsSuccessState(this.products);
}

class FarmGetFarmProductsEmptyState extends FarmStates {
  List<ProductModel> products;
  FarmGetFarmProductsEmptyState(this.products);
}

class FarmGetFarmProductsErrorState extends FarmStates {
  final String error;

  FarmGetFarmProductsErrorState(this.error);
}
