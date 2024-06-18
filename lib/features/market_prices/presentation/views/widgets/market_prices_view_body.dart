import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/market_prices/presentation/view_model/market_prices_cubit/market_prices_cubit.dart';
import 'market_prices_view_builder.dart';

class MarketPricesViewBody extends StatelessWidget {
  const MarketPricesViewBody({
    super.key,
    required this.marketPricesCubit,
    required this.future,
  });
  final Future<List<ProductModel>> future;
  final MarketPricesCubit marketPricesCubit;

  @override
  Widget build(BuildContext context) {
    return MarketPricesViewBuilder(
      marketPricesCubit: marketPricesCubit,
      future: future,
    );
  }
}
