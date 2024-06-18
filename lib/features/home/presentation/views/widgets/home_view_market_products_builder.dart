import 'package:flutter/material.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';

import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'home_view_market_prices_product_list_view.dart';

class HomeViewMarketPricesBuilder extends StatelessWidget {
  const HomeViewMarketPricesBuilder({
    super.key,
    required this.appCubit,
    required this.future,
  });
  final AppCubit appCubit;
  final Future<List<ProductModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
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
          return SizedBox(
            height: 385,
            child: Center(
              child: Text(
                S.of(context).noProductsAvailable,
              ),
            ),
          );
        } else {
          return HomeViewMarketProductListView(
            products: snapshot.data!,
          );
        }
      },
    );
  }
}