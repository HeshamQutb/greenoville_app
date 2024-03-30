import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';

class SiltySoilToolsView extends StatelessWidget {
  const SiltySoilToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Tools',
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
