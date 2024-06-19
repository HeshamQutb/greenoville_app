import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../data/plant_model.dart';
import '../plant_item_view.dart';

class PlantsListViewItem extends StatelessWidget {
  const PlantsListViewItem({
    super.key,
    required this.plantModel,
  });

  final PlantModel plantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(
          context,
          PlantItemView(
            plantModel: plantModel,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: plantModel.plantImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Text(
                    plantModel.plantName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      PlantItemView(
                        plantModel: plantModel,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
