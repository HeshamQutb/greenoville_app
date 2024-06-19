import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/plant_model.dart';
import '../../view_model/plants_cubit/plants_cubit.dart';
import 'plants_view_list_view.dart';

class PlantsViewBuilder extends StatelessWidget {
  const PlantsViewBuilder({
    super.key,
    required this.plantsCubit,
    required this.future,
  });
  final PlantsCubit plantsCubit;
  final Future<List<PlantModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PlantModel>>(
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
                S.of(context).noPlants,
              ),
            ),
          );
        } else {
          return PlantsListView(
            plants: snapshot.data!,
          );
        }
      },
    );
  }
}
