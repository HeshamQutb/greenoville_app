import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/quick_action_button.dart';

import '../../../../../generated/l10n.dart';

class HomeViewQuickActionSection extends StatelessWidget {
  const HomeViewQuickActionSection({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          QuickActionButton(
            icon: Icons.lightbulb_outline,
            label: S.of(context).quickActionLearnTips,
            fontSize: appCubit.isArabic() ? 20 : null,
            onPressed: () {
              appCubit.setPage(3);
            },
          ),
          const SizedBox(width: 8),
          QuickActionButton(
            icon: Icons.question_answer,
            label: S.of(context).quickActionAskExpert,
            fontSize: 20,
            onPressed: () {
              appCubit.setPage(2);
            },
          ),
          const SizedBox(width: 8),
          QuickActionButton(
            icon: Icons.shopping_cart,
            label: S.of(context).quickActionSellProduce,
            fontSize: 20,
            onPressed: () {
              appCubit.setPage(4);
            },
          ),
        ],
      ),
    );
  }
}
