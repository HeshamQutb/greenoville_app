import '../../../../core/utils/assets.dart';
import '../views/silty_soil_fertilizers_view.dart';
import '../views/silty_soil_plants_view.dart';
import '../views/silty_soil_tips_view.dart';
import '../views/silty_soil_tools_view.dart';


List<Map<String, dynamic>> siltySoilListItems = [
  {
    'itemName': 'Plants',
    'itemImage': AssetsData.plants,
    'screen': const SiltySoilPlantsView(),
  },
  {
    'itemName': 'Tips',
    'itemImage': AssetsData.tips,
    'screen': const SiltySoilTipsView(),
  },
  {
    'itemName': 'Fertilizers',
    'itemImage': AssetsData.fertilizers,
    'screen': const SiltySoilFertilizersView(),
  },
  {
    'itemName': 'Tools',
    'itemImage': AssetsData.tools,
    'screen': const SiltySoilToolsView(),
  },
];
