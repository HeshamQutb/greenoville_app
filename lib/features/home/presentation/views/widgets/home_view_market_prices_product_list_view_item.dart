import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/product_item/presentation/views/product_item_view.dart';

class MarketProductListViewItem extends StatelessWidget {
  const MarketProductListViewItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: productModel.productImage!,
                height: 120,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${productModel.productPrice}',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  navigateTo(context, const ProductItemView());
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
