import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/plant_model.dart';
import '../view_model/plants_cubit/plants_cubit.dart';
import 'widgets/plants_view_body.dart';

class PlantsView extends StatefulWidget {
  const PlantsView({
    super.key,
    required this.soilType,
  });
  final String soilType;

  @override
  State<PlantsView> createState() => _PlantsViewState();
}

class _PlantsViewState extends State<PlantsView> {
  late Future<List<PlantModel>> future;
  @override
  void initState() {
    super.initState();
    future = PlantsCubit.get(context).getPlants(
      soilType: widget.soilType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlantsCubit(),
      child: BlocConsumer<PlantsCubit, PlantsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var plantsCubit = PlantsCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).plants,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  PlantsViewBody(
                    plantsCubit: plantsCubit,
                    future: future,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
