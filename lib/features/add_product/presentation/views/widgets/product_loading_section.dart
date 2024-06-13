import 'package:flutter/material.dart';

class ProductLoadingSection extends StatelessWidget {
  const ProductLoadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LinearProgressIndicator(),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}