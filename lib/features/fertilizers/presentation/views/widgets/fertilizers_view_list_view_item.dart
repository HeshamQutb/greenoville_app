import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
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
      onTap: (){
        navigateTo(
          context,
          FertilizerItemView(
            fertilizerModel: fertilizerModel,
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
                    imageUrl: fertilizerModel.fertilizerImage,
                    fit: BoxFit.fill,
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
