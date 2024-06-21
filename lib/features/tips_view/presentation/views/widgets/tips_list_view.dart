import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import '../../view_model/tips_cubit/tips_cubit.dart';
import 'tips_list_view_item.dart';

class TipsListView extends StatelessWidget {
  const TipsListView({
    super.key,
    required this.tips,
    required this.tipsCubit,
  });
  final TipsCubit tipsCubit;
  final List<TipsModel> tips;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return TipsListViewItem(
            tipsCubit: tipsCubit,
            tip: tips[index],
          );
        },
        childCount: tips.length,
      ),
    );
  }
}
