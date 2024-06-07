import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';

class MarketViewFarmInformation extends StatelessWidget {
  const MarketViewFarmInformation({
    super.key,
    required this.marketCubit,
    required this.farm,
  });
  final MarketCubit marketCubit;
  final MarketFarmModel farm;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                navigateTo(
                  context,
                  ProfileView(
                    uId: farm.uId,
                  ),
                );
              },
              child: CircleAvatar(
                radius: 26,
                backgroundImage: CachedNetworkImageProvider(
                  farm.farmImage,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    farm.farmName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${S.of(context).by} ${farm.farmOwnerName}',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    farm.farmLocation,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Contact Button
        ElevatedButton(
          onPressed: () {},
          child: Text(
            '${S.of(context).contact} ${farm.farmOwnerName}',
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
