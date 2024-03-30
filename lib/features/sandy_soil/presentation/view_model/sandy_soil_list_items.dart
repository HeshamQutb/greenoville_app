import '../../../../core/utils/assets.dart';
import '../views/sandy_soil_fertilizers_view.dart';
import '../views/sandy_soil_plants_view.dart';
import '../views/sandy_soil_tips_view.dart';
import '../views/sandy_soil_tools_view.dart';

List<Map<String, dynamic>> sandySoilListItems = [
  {
    'itemName': 'Plants',
    'itemImage': AssetsData.plants,
    'screen': const SandySoilPlantsView(),
  },
  {
    'itemName': 'Tips',
    'itemImage': AssetsData.tips,
    'screen': const SandySoilTipsView(),
  },
  {
    'itemName': 'Fertilizers',
    'itemImage': AssetsData.fertilizers,
    'screen': const SandySoilFertilizersView(),
  },
  {
    'itemName': 'Tools',
    'itemImage': AssetsData.tools,
    'screen': const SandySoilToolsView(),
  },
];
