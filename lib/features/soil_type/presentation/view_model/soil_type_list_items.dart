import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../fertilizers/presentation/views/fertilizers_view.dart';
import '../../../plants/presentation/views/plants_view.dart';
import '../../../soil_tips/presentation/views/soil_tips_view.dart';
import '../../../tools/presentation/views/tools_view.dart';

List<Map<String, dynamic>> soilTypeListItems(
    {required BuildContext context, required String soilType}) {
  return [
    {
      'itemName': S.of(context).plants,
      'itemImage': AssetsData.plants,
      'screen': PlantsView(
        soilType: soilType,
      ),
    },
    {
      'itemName': S.of(context).tips,
      'itemImage': AssetsData.tips,
      'screen': const SoilTipsView(),
    },
    {
      'itemName': S.of(context).fertilizers,
      'itemImage': AssetsData.fertilizers,
      'screen': FertilizersView(
        soilType: soilType,
      ),
    },
    {
      'itemName': S.of(context).tools,
      'itemImage': AssetsData.tools,
      'screen': ToolsView(
        soilType: soilType,
      ),
    },
  ];
}
