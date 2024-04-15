import 'package:flutter/material.dart';
import 'package:greenoville_app/features/plants/presentation/views/widgets/plants_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class PlantsView extends StatelessWidget {
  const PlantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).plants,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const PlantsViewBody(),
    );
  }
}
