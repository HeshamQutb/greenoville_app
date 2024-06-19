import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/plant_model.dart';
import '../../view_model/plants_cubit/plants_cubit.dart';
import 'plants_view_builder.dart';

class PlantsViewBody extends StatelessWidget {
  const PlantsViewBody({
    super.key,
    required this.plantsCubit,
    required this.future,
  });
  final Future<List<PlantModel>> future;
  final PlantsCubit plantsCubit;

  @override
  Widget build(BuildContext context) {
    return PlantsViewBuilder(
      plantsCubit: plantsCubit,
      future: future,
    );
  }
}
