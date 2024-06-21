import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/icon_broken.dart';
import 'package:greenoville_app/features/edit_farm/presentation/views/edit_farm_view.dart';
import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../chat/presentation/views/chat_view.dart';
import '../../../../create_farm/data/models/farm_model.dart';
import '../../view_model/farm_cubit.dart';

class FarmInformationSection extends StatelessWidget {
  const FarmInformationSection({
    super.key,
    required this.farmCubit,
    required this.farm,
  });
  final FarmCubit farmCubit;
  final FarmModel farm;
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
                farm.farmImage!,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 3,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    farm.farmLocation,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (farm.uId == uId)
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    EditFarmView(
                      farm: farm,
                    ),
                  );
                },
                icon: const Icon(
                  IconBroken.Edit,
                  color: kPrimaryColor,
                  size: 30,
                ),
              )
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
