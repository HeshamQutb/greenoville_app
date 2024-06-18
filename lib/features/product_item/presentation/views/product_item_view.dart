import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/generated/l10n.dart';

import 'widgets/product_item_view_body.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: S.of(context).product,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const ProductItemViewBody(),
    );
  }
}
