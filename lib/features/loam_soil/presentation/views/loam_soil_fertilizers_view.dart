import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class LoamSoilFertilizersView extends StatelessWidget {
  const LoamSoilFertilizersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Fertilizers',
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
