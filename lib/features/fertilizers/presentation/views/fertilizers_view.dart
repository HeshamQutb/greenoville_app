import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/fertilizer_model.dart';
import '../view_model/plants_cubit/fertilizers_cubit.dart';
import 'widgets/fertilizers_view_body.dart';

class FertilizersView extends StatefulWidget {
  const FertilizersView({
    super.key,
    required this.soilType,
  });
  final String soilType;

  @override
  State<FertilizersView> createState() => _FertilizersViewState();
}

class _FertilizersViewState extends State<FertilizersView> {
  late Future<List<FertilizerModel>> future;
  @override
  void initState() {
    super.initState();
    future = FertilizersCubit.get(context).getFertilizers(
      soilType: 'loam',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FertilizersCubit(),
      child: BlocConsumer<FertilizersCubit, FertilizersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var fertilizersCubit = FertilizersCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).fertilizers,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  FertilizersViewBody(
                    fertilizersCubit: fertilizersCubit,
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
