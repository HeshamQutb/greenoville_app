import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'package:greenoville_app/features/product_item/presentation/views/product_item_view.dart';

import '../../../../../generated/l10n.dart';

class MarketProductListViewItem extends StatelessWidget {
  const MarketProductListViewItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          ProductItemView(
            productModel: productModel,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: productModel.productImage,
                  height: 120,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // Adjust maxLines as needed
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${S.of(context).price}: ${productModel.productPrice} ${S.of(context).pound}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${S.of(context).quantity}: ${productModel.productQuantity} ${S.of(context).kg}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      ProductItemView(
                        productModel: productModel,
                      ),
                    );
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
      ),
    );
  }
}
