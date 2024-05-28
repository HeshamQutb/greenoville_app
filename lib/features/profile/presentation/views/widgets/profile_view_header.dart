import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../community/data/models/community_post_model.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({
    super.key,
    required this.post,
  });

  final CommunityPostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    post.coverImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 62,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: CachedNetworkImageProvider(
                    post.userImage,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              post.userName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (post.isVerified == true)
              const SizedBox(
                width: 5,
              ),
            if (post.isVerified == true)
              const Icon(
                Icons.check_circle_sharp,
                color: Colors.blueAccent,
                size: 20,
              )
          ],
        ),
        const SizedBox(height: 8),
        const Divider(
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ExpandableText(
            post.bio,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            expandText: '',
            collapseOnTextTap: true,
            expandOnTextTap: true,
          ),
        ),
      ],
    );
  }
}
