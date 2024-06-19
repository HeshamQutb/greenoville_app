import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/fertilizer_model.dart';
import '../../view_model/plants_cubit/fertilizers_cubit.dart';
import 'fertilizers_view_list_view.dart';

class FertilizersViewBuilder extends StatelessWidget {
  const FertilizersViewBuilder({
    super.key,
    required this.fertilizersCubit,
    required this.future,
  });
  final FertilizersCubit fertilizersCubit;
  final Future<List<FertilizerModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FertilizerModel>>(
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
              child: Text(
                '${S.of(context).error}: ${snapshot.error}',
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                S.of(context).noFertilizers,
              ),
            ),
          );
        } else {
          return FertilizersListView(
            fertilizers: snapshot.data!,
          );
        }
      },
    );
  }
}
