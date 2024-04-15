import 'package:flutter/material.dart';
import 'package:greenoville_app/features/fertilizers/presentation/views/widgets/fertilizers_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class FertilizersView extends StatelessWidget {
  const FertilizersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).fertilizers,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const FertilizersViewBody(),
    );
  }
}
