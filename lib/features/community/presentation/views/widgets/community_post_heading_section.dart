import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/account/presentation/views/account_view.dart';
import 'package:greenoville_app/features/community/presentation/view_model/community_cubit/community_cubit.dart';
import 'package:greenoville_app/features/edit_post/presentation/views/edit_post_view.dart';

import '../../../../../core/services/format_time_stamp.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../data/models/community_post_model.dart';

class CommunityPostHeadingSection extends StatelessWidget {
  const CommunityPostHeadingSection({
    super.key,
    required this.post,
    required this.communityCubit,
  });
  final CommunityPostModel post;
  final CommunityCubit communityCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            navigateTo(
              context,
              post.uId == uId
                  ? const AccountView()
                  : ProfileView(
                      uId: post.uId,
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
                post.uId == uId
                    ? const AccountView()
                    : ProfileView(
                        uId: post.uId,
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
        if (post.uId == uId)
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 140,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -2),
                          leading: const Icon(Icons.edit),
                          title: Text(S.of(context).editPost),
                          onTap: () {
                            Navigator.pop(context);
                            navigateTo(
                              context,
                              EditPostView(
                                postId: post.postId,
                                timestamp: post.timestamp,
                                postImage: post.postImage,
                                description: post.description,
                              ),
                            );
                          },
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: const Icon(Icons.delete),
                          title: Text(S.of(context).deletePost),
                          onTap: () {
                            Navigator.pop(context);
                            communityCubit.deletePost(postId: post.postId);
                          },
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        DefaultTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: S.of(context).cancel,
                          size: 15,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_horiz),
            color: Theme.of(context).iconTheme.color,
          )
      ],
    );
  }
}
