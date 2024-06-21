import 'package:flutter/material.dart';
import 'package:greenoville_app/features/soil_tips/presentation/views/widgets/soil_tips_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class SoilTipsView extends StatelessWidget {
  const SoilTipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).tips,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const SoilTipsViewBody(),
    );
  }
}
