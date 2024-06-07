import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';
import 'market_view_list_view_items.dart';

class MarketFarmListViewItemsBuilder extends StatelessWidget {
  const MarketFarmListViewItemsBuilder({
    super.key,
    required this.futureFarms,
    required this.marketCubit,
  });

  final MarketCubit marketCubit;
  final Future<List<MarketFarmModel>> futureFarms;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MarketFarmModel>>(
      future: futureFarms,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('${S.of(context).error} ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(S.of(context).noFarmsAvailable),
            ),
          );
        } else {
          return MarketViewListViewItems(
            farms: snapshot.data!,
            marketCubit: marketCubit,
          );
        }
      },
    );
  }
}
