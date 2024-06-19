import 'package:flutter/material.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_cubit.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import '../../../../../generated/l10n.dart';
import 'farm_products_section.dart';

class FarmProductSectionBuilder extends StatefulWidget {
  const FarmProductSectionBuilder({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  State<FarmProductSectionBuilder> createState() =>
      _FarmProductSectionBuilderState();
}

class _FarmProductSectionBuilderState extends State<FarmProductSectionBuilder> {
  late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = FarmCubit.get(context).getProducts(uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${S.of(context).error} ${snapshot.error}',
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(S.of(context).noProductsAvailable),
          );
        } else {
          return FarmProductsSection(
            products: snapshot.data!,
          );
        }
      },
    );
  }
}
