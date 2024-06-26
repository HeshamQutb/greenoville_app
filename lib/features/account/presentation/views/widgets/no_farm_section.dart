import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/create_farm/presentation/views/create_farm_view.dart';

import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';

class NoFarmSection extends StatelessWidget {
  const NoFarmSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          S.of(context).doNotHaveAFarm,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        DefaultButton(
          onPressed: () {
            navigateTo(
              context,
              const CreateFarmView(),
            );
          },
          text: S.of(context).createFarm,
        ),
      ],
    );
  }
}
