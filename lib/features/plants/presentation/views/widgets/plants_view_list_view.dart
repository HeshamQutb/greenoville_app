import 'package:flutter/material.dart';
import 'package:greenoville_app/features/plants/presentation/views/widgets/plants_view_list_view_item.dart';
import '../../../data/plant_model.dart';

class PlantsListView extends StatelessWidget {
  const PlantsListView({
    super.key,
    required this.plants,
  });
  final List<PlantModel> plants;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: plants.length,
        (context, index) {
          return PlantsListViewItem(
            plantModel: plants[index],
          );
        },
      ),
    );
  }
}
