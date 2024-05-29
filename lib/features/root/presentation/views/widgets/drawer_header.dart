import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';

import '../../../../../constants.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(
            kUserModel!.userImage,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  kUserModel!.userName,
                  style: const TextStyle(fontSize: 16),
                ),
                if (kUserModel!.isVerified)
                  const SizedBox(
                    width: 5,
                  ),
                if (kUserModel!.isVerified)
                  const Icon(
                    Icons.check_circle_sharp,
                    color: Colors.blueAccent,
                    size: 15,
                  )
              ],
            ),
            Text(
              kUserModel!.userEmail,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
