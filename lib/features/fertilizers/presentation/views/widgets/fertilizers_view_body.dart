import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/fertilizer_model.dart';
import '../../view_model/plants_cubit/fertilizers_cubit.dart';
import 'fertilizers_view_builder.dart';

class FertilizersViewBody extends StatelessWidget {
  const FertilizersViewBody({
    super.key,
    required this.fertilizersCubit,
    required this.future,
  });
  final Future<List<FertilizerModel>> future;
  final FertilizersCubit fertilizersCubit;

  @override
  Widget build(BuildContext context) {
    return FertilizersViewBuilder(
      fertilizersCubit: fertilizersCubit,
      future: future,
    );
  }
}
