import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import '../../view_model/tips_cubit/tips_cubit.dart';
import 'tips_list_view.dart';

class TipsListViewBuilder extends StatelessWidget {
  const TipsListViewBuilder({
    super.key,
    required this.future,
    required this.tipsCubit,
  });

  final TipsCubit tipsCubit;
  final Future<List<TipsModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TipsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('${S.of(context).error} ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(S.of(context).noPostsAvailable),
            ),
          );
        } else {
          return TipsListView(
            tips: snapshot.data!,
            tipsCubit: tipsCubit,
          );
        }
      },
    );
  }
}
