import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/add_tips/presentation/views/add_tips_view.dart';

import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';

class NoTipsSection extends StatelessWidget {
  const NoTipsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          S.of(context).doNotHaveTips,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        DefaultButton(
          onPressed: () {
            navigateTo(
              context,
              const AddTipsView(),
            );
          },
          text: S.of(context).addTips,
        ),
      ],
    );
  }
}
