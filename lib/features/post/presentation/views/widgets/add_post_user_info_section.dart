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
            userModel?.image,
          ),
          radius: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel?.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.4,
              ),
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