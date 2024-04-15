import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/community_post_model.dart';

class CommunityPostHeadingSection extends StatelessWidget {
  const CommunityPostHeadingSection({super.key, required this.post});
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            post.image,
          ),
          radius: 25,
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
                    post.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.4),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.check_circle_sharp,
                    color: Colors.blueAccent,
                    size: 13,
                  )
                ],
              ),
              Text(
                post.dateTime,
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