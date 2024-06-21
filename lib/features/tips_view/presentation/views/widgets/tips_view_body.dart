import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import '../../view_model/tips_cubit/tips_cubit.dart';
import 'tips_list_view_builder.dart';

class TipsViewBody extends StatelessWidget {
  const TipsViewBody({
    super.key,
    required this.future,
    required this.tipsCubit,
  });
  final TipsCubit tipsCubit;
  final Future<List<TipsModel>> future;
  @override
  Widget build(BuildContext context) {
    return TipsListViewBuilder(
      future: future,
      tipsCubit: tipsCubit,
    );
  }
}
