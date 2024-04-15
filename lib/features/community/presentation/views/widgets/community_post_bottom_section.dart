import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../../post/presentation/views/post_view.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class CommunityPostBottomSection extends StatelessWidget {
  const CommunityPostBottomSection({
    super.key,
    required this.appCubit,
    required this.post,
    required this.communityCubit,
  });
  final AppCubit appCubit;
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  post.image,
                ),
                radius: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  navigateTo(context, PostView(appCubit: appCubit));
                },
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
          onTap: () {
            communityCubit.postLike(
              postId: post.postId,
              uId: uId!,
              likes: post.likes,
            );
          },
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
