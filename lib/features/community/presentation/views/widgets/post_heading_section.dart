import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/services/format_time_stamp.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/models/community_post_model.dart';

class PostHeadingSection extends StatelessWidget {
  const PostHeadingSection({
    super.key,
    required this.post,
    required this.appCubit,
  });
  final CommunityPostModel post;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            navigateTo(
              context,
              post.uId == uId
                  ? AccountView(
                      appCubit: appCubit,
                    )
                  : ProfileView(
                      post: post,
                    ),
            );
          },
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              post.userImage,
            ),
            radius: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    post.userName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.4),
                  ),
                  if (post.isVerified == true)
                    const SizedBox(
                      width: 5,
                    ),
                  if (post.isVerified == true)
                    const Icon(
                      Icons.check_circle_sharp,
                      color: Colors.blueAccent,
                      size: 13,
                    )
                ],
              ),
              Text(
                formatTimestamp(post.timestamp),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(height: 1.4),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          color: Theme.of(context).iconTheme.color,
        )
      ],
    );
  }
}
