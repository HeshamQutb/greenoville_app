import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';

class PostBottomSection extends StatelessWidget {
  const PostBottomSection({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  AssetsData.testProfileImage,
                ),
                radius: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  S.of(context).writeAComment,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(height: 1.4),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              const Icon(
                IconBroken.Heart,
                size: 15,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                S.of(context).like,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              const Icon(
                IconBroken.Upload,
                size: 15,
                color: Colors.red,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                S.of(context).share,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
