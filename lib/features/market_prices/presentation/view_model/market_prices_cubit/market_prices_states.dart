part of 'market_prices_cubit.dart';

abstract class MarketPricesStates {
  const MarketPricesStates();
}

class MarketPricesInitialState extends MarketPricesStates {}

// Get Products States
class MarketPricesGetProductsLoadingState extends MarketPricesStates {}

class MarketPricesGetProductsSuccessState extends MarketPricesStates {}

class MarketPricesGetProductsErrorState extends MarketPricesStates {
  final String error;

  MarketPricesGetProductsErrorState(this.error);
}


