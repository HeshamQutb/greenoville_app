import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';
import 'market_view_list_view_item.dart';

class MarketViewListViewItems extends StatelessWidget {
  const MarketViewListViewItems({
    super.key,
    required this.farms,
    required this.marketCubit,
  });
  final MarketCubit marketCubit;
  final List<MarketFarmModel> farms;
  @override
  Widget build(BuildContext context) {
    final filteredFarms = farms.where((farm) => farm.hasProducts).toList();
    if (filteredFarms.isEmpty) {
      return  SliverFillRemaining(
        child: Center(
          child: Text(S.of(context).noProductsAvailable),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MarketViewListViewItem(
            marketCubit: marketCubit,
            farm: filteredFarms[index],
          );
        },
        childCount: farms.length,
      ),
    );
  }
}
