import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/data/models/community_like_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/models/community_post_model.dart';

class LikesListViewItem extends StatelessWidget {
  const LikesListViewItem({
    super.key,
    required this.like,
    required this.post,
  });
  final CommunityLikeModel like;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(
          context,
          post.uId == uId
              ? const AccountView()
              : ProfileView(
            uId: post.uId,
          ),
        );
      },
      child: ListTile(
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
      ),
    );
  }
}
