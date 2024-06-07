import 'package:flutter/material.dart';

import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';
import 'market_farm_list_view_item.dart';

class MarketListView extends StatelessWidget {
  const MarketListView({
    super.key,
    required this.farms,
    required this.marketCubit,
  });
  final MarketCubit marketCubit;
  final List<MarketFarmModel> farms;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return MarketFarmListViewItem(
            marketCubit: marketCubit,
            farm: farms[index],
          );
        },
        childCount: farms.length,
      ),
    );
  }
}