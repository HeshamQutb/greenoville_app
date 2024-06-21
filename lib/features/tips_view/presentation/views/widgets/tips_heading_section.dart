import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/account/presentation/views/account_view.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

import '../../../../profile/presentation/views/profile_view.dart';
import '../../view_model/tips_cubit/tips_cubit.dart';

class TipsHeadingSection extends StatelessWidget {
  const TipsHeadingSection({
    super.key,
    required this.tip,
    required this.tipsCubit,
  });
  final TipsModel tip;
  final TipsCubit tipsCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            navigateTo(
              context,
              tip.uId == uId
                  ? const AccountView()
                  : ProfileView(
                      uId: tip.uId,
                    ),
            );
          },
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              tip.userImage,
            ),
            radius: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              navigateTo(
                context,
                tip.uId == uId
                    ? const AccountView()
                    : ProfileView(
                        uId: tip.uId,
                      ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      tip.userName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.4),
                    ),
                    if (tip.isVerified == true)
                      const SizedBox(
                        width: 5,
                      ),
                    if (tip.isVerified == true)
                      const Icon(
                        Icons.check_circle_sharp,
                        color: Colors.blueAccent,
                        size: 13,
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
