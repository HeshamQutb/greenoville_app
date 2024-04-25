import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/community_post_model.dart';

class CommunityPostImageSection extends StatelessWidget {
  const CommunityPostImageSection({super.key, required this.post});
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          image:  DecorationImage(
            image: CachedNetworkImageProvider(
              post.postImage ?? '',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
