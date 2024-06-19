import 'package:flutter/material.dart';
import 'package:greenoville_app/features/farm/presentation/views/widgets/farm_product_item.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';

class FarmProductsSection extends StatelessWidget {
  const FarmProductsSection({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.2 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return FarmProductItem(
          productModel: product,
        );
      },
    );
  }
}
