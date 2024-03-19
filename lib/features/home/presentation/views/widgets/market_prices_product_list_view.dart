import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/market_prices_product_list_view_item.dart';

class MarketProductListView extends StatelessWidget {
  const MarketProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 385,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const MarketProductListViewItem(
          name: 'Tomatoes',
          price: '\$2.50/kg',
          image: AssetsData.testTomato,
        ),
      ),
    );
  }
}