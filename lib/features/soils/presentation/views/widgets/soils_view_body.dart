import 'package:flutter/material.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soil_view_search_results.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import 'soils_view_body_list_view.dart';

class SoilsViewBody extends StatelessWidget {
  const SoilsViewBody({
    super.key,
    required this.appCubit,
    required this.query,
  });
  final AppCubit appCubit;
  final String query;

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return SoilsViewBodyListView(
        appCubit: appCubit,
      );
    } else {
      return SoilsSearchResults(
        appCubit: appCubit,
        query: query,
      );
    }
  }
}
