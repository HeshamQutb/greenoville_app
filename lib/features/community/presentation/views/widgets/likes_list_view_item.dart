import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/data/models/community_like_model.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../data/models/community_post_model.dart';

class LikesListViewItem extends StatelessWidget {
  const LikesListViewItem({
    super.key,
    required this.like,
    required this.appCubit,
    required this.post,
  });
  final CommunityLikeModel like;
  final AppCubit appCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          like.userImage!,
        ),
      ),
      title: Row(
        children: [
          Text(
            like.userName!,
          ),
          if (like.isVerified == true)
            const SizedBox(
              width: 5,
            ),
          if (like.isVerified == true)
            const Icon(
              Icons.check_circle_sharp,
              color: Colors.blueAccent,
              size: 13,
            )
        ],
      ),
      trailing: const Icon(
        IconBroken.Heart,
        size: 24,
        color: Colors.red,
      ),
    );
  }
}
