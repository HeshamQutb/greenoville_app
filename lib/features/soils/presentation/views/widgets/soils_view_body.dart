import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import 'soils_view_body_list_view.dart';

class SoilsViewBody extends StatelessWidget {
  const SoilsViewBody({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return SoilsViewBodyListView(
      appCubit: appCubit,
    );
  }
}
