import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SiltySoilPlantsView extends StatelessWidget {
  const SiltySoilPlantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: 'Plants',
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
