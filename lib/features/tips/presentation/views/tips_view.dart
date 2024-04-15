import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tips/presentation/views/widgets/tips_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).tips,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const TipsViewBody(),
    );
  }
}
