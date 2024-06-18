import 'package:flutter/material.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_market_prices_product_list_view_item.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';

class HomeViewMarketProductListView extends StatelessWidget {
  const HomeViewMarketProductListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 385,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length < 3 ? products.length : 3,
        itemBuilder: (context, index) => MarketProductListViewItem(
          productModel: products[index],
        ),
      ),
    );
  }
}
