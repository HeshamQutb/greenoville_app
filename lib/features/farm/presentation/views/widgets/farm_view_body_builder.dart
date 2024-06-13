import 'package:flutter/material.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../create_farm/data/models/farm_model.dart';
import 'farm_view_body.dart';

class FarmViewBodyBuilder extends StatelessWidget {
  const FarmViewBodyBuilder({
    super.key,
    required this.farmCubit,
    required this.futureFarm,
  });
  final FarmCubit farmCubit;
  final Future<FarmModel?> futureFarm;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FarmModel?>(
      future: futureFarm,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${S.of(context).error} ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text(S.of(context).noFarmsAvailable),
          );
        } else {
          return FarmViewBody(
            farmCubit: farmCubit,
            farm: snapshot.data!,
          );
        }
      },
    );
  }
}
