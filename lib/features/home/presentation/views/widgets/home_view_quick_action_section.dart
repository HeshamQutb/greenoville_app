import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_quick_action_button.dart';

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
          HomeViewQuickActionButton(
            icon: Icons.lightbulb_outline,
            label: S.of(context).quickActionLearnTips,
            onPressed: () {
              appCubit.setPage(3);
            },
          ),
          const SizedBox(width: 8),
          HomeViewQuickActionButton(
            icon: Icons.question_answer,
            label: S.of(context).quickActionAskExpert,
            onPressed: () {
              appCubit.setPage(2);
            },
          ),
          const SizedBox(width: 8),
          HomeViewQuickActionButton(
            icon: Icons.shopping_cart,
            label: S.of(context).quickActionSellProduce,
            onPressed: () {
              appCubit.setPage(4);
            },
          ),
        ],
      ),
    );
  }
}
