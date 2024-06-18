import 'package:flutter/material.dart';


class ProductItemViewBody extends StatefulWidget {
  const ProductItemViewBody({super.key});

  @override
  State<ProductItemViewBody> createState() => _ProductItemViewBodyState();
}

class _ProductItemViewBodyState extends State<ProductItemViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [],
      ),
    );
  }
}
