import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/profile/presentation/views/farmer_profile_view.dart';

import '../../../../../core/services/format_time_stamp.dart';
import '../../../../profile/presentation/views/expert_profile_view.dart';
import '../../../data/models/community_post_model.dart';

class CommunityPostHeadingSection extends StatelessWidget {
  const CommunityPostHeadingSection({super.key, required this.post});
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            navigateTo(
              context,
              const ExpertProfileView(
                name: '',
                title: '',
                bio: '',
                email: '',
                phone: '',
                expertise: [],
                posts: [],
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
          child: InkWell(
            onTap: () {
              navigateTo(
                context,
                const FarmerProfileView(
                  name: '',
                  farmName: '',
                  bio: '',
                  location: '',
                  contactNumber: '',
                  produceItems: [],
                  posts: [],
                ),
              );
            },
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
