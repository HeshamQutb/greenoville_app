import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

import '../../../data/fertilizer_model.dart';
import '../fertilizer_item_view.dart';

class FertilizersListViewItem extends StatelessWidget {
  const FertilizersListViewItem({
    super.key,
    required this.fertilizerModel,
  });

  final FertilizerModel fertilizerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          FertilizerItemView(
            fertilizerModel: fertilizerModel,
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
                    imageUrl: fertilizerModel.fertilizerImage,
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
                  fertilizerModel.fertilizerName,
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
                    FertilizerItemView(
                      fertilizerModel: fertilizerModel,
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
