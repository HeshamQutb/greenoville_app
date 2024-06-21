import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/plants/data/plant_model.dart';

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
      onTap: () {
        navigateTo(
          context,
          PlantItemView(
            plantModel: plantModel,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: plantModel.plantImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 12),
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
        ),
      ),
    );
  }
}
