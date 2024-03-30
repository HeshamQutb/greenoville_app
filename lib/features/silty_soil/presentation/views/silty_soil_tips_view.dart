import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SiltySoilTipsView extends StatelessWidget {
  const SiltySoilTipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tips',
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
