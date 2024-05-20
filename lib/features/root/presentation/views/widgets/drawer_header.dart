import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';

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
            appCubit.userModel!.userImage??
                'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/users%2Funknown%20user.png?alt=media&token=3f02443f-1b9b-4c79-9d7d-e65cd4479f04',
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
                  appCubit.userModel!.userName,
                  style: const TextStyle(fontSize: 16),
                ),
                if (appCubit.userModel!.isVerified)
                  const SizedBox(
                    width: 5,
                  ),
                if (appCubit.userModel!.isVerified)
                  const Icon(
                    Icons.check_circle_sharp,
                    color: Colors.blueAccent,
                    size: 15,
                  )
              ],
            ),
            Text(
              appCubit.userModel!.userEmail,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
