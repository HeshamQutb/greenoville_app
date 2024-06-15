import 'package:flutter/material.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import 'likes_list_view_item.dart';

class LikesListView extends StatelessWidget {
  const LikesListView({
    super.key,
    required this.likes,
    required this.post,
  });
  final List<CommunityLikeModel> likes;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final like = likes[index];
          return LikesListViewItem(
            like: like,
          );
        },
        childCount: likes.length,
      ),
    );
  }
}
