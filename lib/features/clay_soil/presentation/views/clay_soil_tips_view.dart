import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ClaySoilTipsView extends StatelessWidget {
  const ClaySoilTipsView({super.key});

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
