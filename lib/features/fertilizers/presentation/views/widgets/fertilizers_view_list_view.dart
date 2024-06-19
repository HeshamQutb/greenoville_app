import 'package:flutter/material.dart';
import '../../../data/fertilizer_model.dart';
import 'Fertilizers_view_list_view_item.dart';

class FertilizersListView extends StatelessWidget {
  const FertilizersListView({
    super.key,
    required this.fertilizers,
  });
  final List<FertilizerModel> fertilizers;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: fertilizers.length,
        (context, index) {
          return FertilizersListViewItem(
            fertilizerModel: fertilizers[index],
          );
        },
      ),
    );
  }
}
