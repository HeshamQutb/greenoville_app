import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage:
              CachedNetworkImageProvider(AssetsData.testProfileImage),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hesham Qutb',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'heshsaker9@gmail.com',
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
