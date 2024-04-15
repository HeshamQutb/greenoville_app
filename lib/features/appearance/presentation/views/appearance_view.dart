import 'package:flutter/material.dart';
import 'package:greenoville_app/features/appearance/presentation/views/widgets/appearance_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class AppearanceView extends StatelessWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).appearance,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const AppearanceViewBody(),
    );
  }
}
