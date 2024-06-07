import 'package:flutter/material.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';
import 'market_farm_list_view_items_builder.dart';

class MarketViewBody extends StatelessWidget {
  const MarketViewBody({
    super.key,
    required this.futureFarms,
    required this.marketCubit,
  });
  final MarketCubit marketCubit;
  final Future<List<MarketFarmModel>> futureFarms;
  @override
  Widget build(BuildContext context) {
    return MarketFarmListViewItemsBuilder(
      futureFarms: futureFarms,
      marketCubit: marketCubit,
    );
  }
}
