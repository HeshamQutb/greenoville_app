import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import 'likes_list_view.dart';

class LikesListViewBuilder extends StatelessWidget {
  const LikesListViewBuilder({super.key, required this.appCubit, required this.post});

  final AppCubit appCubit;
  final CommunityPostModel post;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommunityLikeModel>>(
      stream: appCubit.getLikes(postId: post.postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('${S.of(context).noComments} ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(S.of(context).noLikes),
            ),
          );
        } else {
          final likes = snapshot.data!;
          return LikesListView(
            likes: likes,
            appCubit: appCubit,
            post: post,
          );
        }
      },
    );
  }
}


