import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../fertilizers/data/fertilizer_model.dart';
import '../../../../fertilizers/presentation/views/widgets/Fertilizers_view_list_view_item.dart';
import '../../../../plants/data/plant_model.dart';
import '../../../../plants/presentation/views/widgets/plants_view_list_view_item.dart';
import '../../../../tools/data/tool_model.dart';
import '../../../../tools/presentation/views/widgets/tools_view_list_view_item.dart';

class SoilsSearchResults extends StatelessWidget {
  const SoilsSearchResults({
    super.key,
    required this.appCubit,
    required this.query,
  });
  final AppCubit appCubit;
  final String query;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: appCubit.searchAllCollections(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${S.of(context).error}: ${snapshot.error}',
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('${S.of(context).noResultFound} $query'));
        }

        // Process data when available
        List<dynamic> items = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            if (item is PlantModel) {
              return PlantsListViewItem(
                plantModel: item,
              );
            } else if (item is ToolModel) {
              return ToolsListViewItem(
                toolModel: item,
              );
            } else if (item is FertilizerModel) {
              return FertilizersListViewItem(
                fertilizerModel: item,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
