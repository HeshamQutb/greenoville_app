import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';
import 'replay_item_bottom_section.dart';
import 'replay_item_content_section.dart';

class RepliesListViewItem extends StatelessWidget {
  const RepliesListViewItem({
    super.key,
    required this.appCubit,
    required this.post,
    required this.replay,
    required this.comment,
  });
  final AppCubit appCubit;
  final CommunityPostModel post;
  final CommunityCommentModel replay;
  final CommunityCommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appCubit.isArabic()
          ? const EdgeInsets.only(right: 56)
          : const EdgeInsets.only(left: 56),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  replay.userImage,
                ),
                radius: 25,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    ReplayItemContentSection(
                      appCubit: appCubit,
                      post: post,
                      replay: replay,
                    ),
                    ReplayItemBottomSection(
                      appCubit: appCubit,
                      post: post,
                      replay: replay,
                      comment: comment,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}



class FacebookCommentArrow extends StatelessWidget {
  final double size;
  final Color color;

  const FacebookCommentArrow({super.key, this.size = 12.0, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(45.0 * (pi / 180.0)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size / 2.0),
        ),
      ),
    );
  }
}


