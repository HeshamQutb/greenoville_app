import '../../../../core/utils/assets.dart';
import '../views/clay_soil_fertilizers_view.dart';
import '../views/clay_soil_plants_view.dart';
import '../views/clay_soil_tips_view.dart';
import '../views/clay_soil_tools_view.dart';



List<Map<String, dynamic>> claySoilListItems = [
  {
    'itemName': 'Plants',
    'itemImage': AssetsData.plants,
    'screen': const ClaySoilPlantsView(),
  },
  {
    'itemName': 'Tips',
    'itemImage': AssetsData.tips,
    'screen': const ClaySoilTipsView(),
  },
  {
    'itemName': 'Fertilizers',
    'itemImage': AssetsData.fertilizers,
    'screen': const ClaySoilFertilizersView(),
  },
  {
    'itemName': 'Tools',
    'itemImage': AssetsData.tools,
    'screen': const ClaySoilToolsView(),
  },
];
