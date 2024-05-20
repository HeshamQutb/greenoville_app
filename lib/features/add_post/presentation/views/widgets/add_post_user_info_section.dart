import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';

class AddPostUserInfoSection extends StatelessWidget {
  const AddPostUserInfoSection({
    super.key,
    required this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            userModel!.userImage??
                'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/users%2Funknown%20user.png?alt=media&token=3f02443f-1b9b-4c79-9d7d-e65cd4479f04',
          ),
          radius: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  userModel!.userName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.4,
                  ),
                ),
                if (userModel?.isVerified == true)
                  const SizedBox(
                    width: 5,
                  ),
                if (userModel?.isVerified == true)
                  const Icon(
                    Icons.check_circle_sharp,
                    color: Colors.blueAccent,
                    size: 13,
                  )
              ],
            ),
            Text(
              S.of(context).public,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(height: 1.4),
            ),
          ],
        ),
      ],
    );
  }
}