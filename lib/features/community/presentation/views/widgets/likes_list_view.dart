import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import 'likes_list_view_item.dart';

class LikesListView extends StatelessWidget {
  const LikesListView({
    super.key,
    required this.likes,
    required this.appCubit,
    required this.post,
  });
  final List<CommunityLikeModel> likes;
  final AppCubit appCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final like = likes[index];
          return LikesListViewItem(
            like: like,
            appCubit: appCubit,
            post: post,
          );
        },
        childCount: likes.length,
      ),
    );
  }
}
