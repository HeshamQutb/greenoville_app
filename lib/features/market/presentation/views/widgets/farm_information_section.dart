import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../generated/l10n.dart';
import '../../../../chat/presentation/views/chat_view.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';

class FarmInformationSection extends StatelessWidget {
  const FarmInformationSection({
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
            CircleAvatar(
              radius: 26,
              backgroundImage: CachedNetworkImageProvider(
                farm.farmImage,
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
        if (farm.uId != uId)
          ElevatedButton(
            onPressed: () {
              navigateTo(
                context,
                ChatView(friendID: farm.uId),
              );
            },
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
