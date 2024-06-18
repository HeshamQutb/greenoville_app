import 'package:flutter/material.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/market_prices_cubit/market_prices_cubit.dart';
import 'market_prices_list_view.dart';

class MarketPricesViewBuilder extends StatelessWidget {
  const MarketPricesViewBuilder({
    super.key,
    required this.marketPricesCubit,
    required this.future,
  });
  final MarketPricesCubit marketPricesCubit;
  final Future<List<ProductModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                '${S.of(context).error}: ${snapshot.error}',
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                S.of(context).noProductsAvailable,
              ),
            ),
          );
        } else {
          return MarketPricesListView(
            products: snapshot.data!,
          );
        }
      },
    );
  }
}
