import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soils_view_custom_app_bar.dart';
import 'widgets/soils_view_body.dart';
import 'package:greenoville_app/constants.dart';

class SoilsView extends StatefulWidget {
  const SoilsView({super.key});

  @override
  State<SoilsView> createState() => _SoilsViewState();
}

class _SoilsViewState extends State<SoilsView> {
  late TextEditingController soilSearchController;
  late AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    soilSearchController = TextEditingController();
    appCubit = AppCubit.get(context);

    // Trigger search when the text changes
    soilSearchController.addListener(() {
      setState(() {}); // Rebuild to update the query
    });
  }

  @override
  void dispose() {
    soilSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SoilsViewCustomAppBar(
            appCubit: appCubit,
            soilSearchController: soilSearchController,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SoilsViewBody(
              appCubit: appCubit,
              query: soilSearchController.text,
            ),
          ),
        ],
      ),
    );
  }
}
