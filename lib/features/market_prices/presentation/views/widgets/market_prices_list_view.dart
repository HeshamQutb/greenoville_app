import 'package:flutter/material.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/market_prices/presentation/views/widgets/market_prices_list_view_item.dart';

class MarketPricesListView extends StatelessWidget {
  const MarketPricesListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: products.length,
        (context, index) {
          return MarketPricesListViewItem(
            productModel: products[index],
          );
        },
      ),
    );
  }
}
