import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/silty_soil/presentation/views/silty_soil_view.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soils_view_body_list_view_item.dart';
import '../../../../clay_soil/presentation/views/clay_soil_view.dart';
import '../../../../loam_soil/presentation/views/loam_soil_view.dart';
import '../../../../sandy_soil/presentation/views/sandy_soil_view.dart';

class SoilsViewBodyListView extends StatelessWidget {
  const SoilsViewBodyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            navigateTo(context, const ClaySoilView());
          },
          child: const SoilsViewBodyListViewItem(
            soilImage: AssetsData.claySoil,
            soilName: 'Clay Soil',
            imageRight: true,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(context, const SandySoilView());
          },
          child: const SoilsViewBodyListViewItem(
            soilImage: AssetsData.sandySoil,
            soilName: 'Sandy Soil',
            imageRight: false,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(context, const SiltySoilView());
          },
          child: const SoilsViewBodyListViewItem(
            soilImage: AssetsData.siltySoil,
            soilName: 'Silty Soil',
            imageRight: true,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(context, const LoamSoilView());
          },
          child: const SoilsViewBodyListViewItem(
            soilImage: AssetsData.loamSoil,
            soilName: 'Loam Soil',
            imageRight: false,
          ),
        ),
      ],
    );
  }
}
