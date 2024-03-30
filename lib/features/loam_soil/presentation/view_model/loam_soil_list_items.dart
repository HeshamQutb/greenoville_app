import '../../../../core/utils/assets.dart';
import '../views/loam_soil_fertilizers_view.dart';
import '../views/loam_soil_plants_view.dart';
import '../views/loam_soil_tips_view.dart';
import '../views/loam_soil_tools_view.dart';

List<Map<String, dynamic>> loamSoilListItems = [
  {
    'itemName': 'Plants',
    'itemImage': AssetsData.plants,
    'screen': const LoamSoilPlantsView(),
  },
  {
    'itemName': 'Tips',
    'itemImage': AssetsData.tips,
    'screen': const LoamSoilTipsView(),
  },
  {
    'itemName': 'Fertilizers',
    'itemImage': AssetsData.fertilizers,
    'screen': const LoamSoilFertilizersView(),
  },
  {
    'itemName': 'Tools',
    'itemImage': AssetsData.tools,
    'screen': const LoamSoilToolsView(),
  },
];
