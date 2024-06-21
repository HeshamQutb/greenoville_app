import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import 'package:greenoville_app/features/tips_view/presentation/views/widgets/tips_heading_section.dart';
import 'package:greenoville_app/features/tips_view/presentation/views/widgets/tips_text_section.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../view_model/tips_cubit/tips_cubit.dart';

class TipsListViewItem extends StatelessWidget {
  const TipsListViewItem({
    super.key,
    required this.tip,
    required this.tipsCubit,
  });
  final TipsCubit tipsCubit;
  final TipsModel tip;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey[700],
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TipsHeadingSection(
              tip: tip,
              tipsCubit: tipsCubit,
            ),
            const CustomDivider(
              top: 12,
              bottom: 12,
            ),
            TipsTextSection(
              tip: tip,
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
