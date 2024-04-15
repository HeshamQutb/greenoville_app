import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../fertilizers/presentation/views/fertilizers_view.dart';
import '../../../plants/presentation/views/plants_view.dart';
import '../../../tips/presentation/views/tips_view.dart';
import '../../../tools/presentation/views/tools_view.dart';




List<Map<String, dynamic>> soilTypeListItems(BuildContext context) {
  return [
    {
      'itemName': S.of(context).plants,
      'itemImage': AssetsData.plants,
      'screen': const PlantsView(),
    },
    {
      'itemName': S.of(context).tips,
      'itemImage': AssetsData.tips,
      'screen': const TipsView(),
    },
    {
      'itemName': S.of(context).fertilizers,
      'itemImage': AssetsData.fertilizers,
      'screen': const FertilizersView(),
    },
    {
      'itemName': S.of(context).tools,
      'itemImage': AssetsData.tools,
      'screen': const ToolsView(),
    },
  ];
}
