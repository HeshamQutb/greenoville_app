import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/community/presentation/views/replay_view.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/services/format_time_stamp.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';

class CommentItemBottomSection extends StatelessWidget {
  const CommentItemBottomSection({
    super.key,
    required this.appCubit,
    required this.post,
    required this.comment,
  });
  final AppCubit appCubit;
  final CommunityPostModel post;
  final CommunityCommentModel comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Text(
            formatTimestamp(comment.timestamp),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.4),
          ),
          const SizedBox(width: 15),
          InkWell(
            onTap: () {
              appCubit.likeComment(
                postId: post.postId,
                commentId: comment.commentId,
              );
            },
            child: Text(
              S.of(context).like,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.4),
            ),
          ),
          const SizedBox(width: 15),
          InkWell(
            onTap: () {
              navigateTo(
                context,
                ReplayView(
                  appCubit: appCubit,
                  post: post,
                  comment: comment,
                ),
              );
            },
            child: Text(
              S.of(context).replay,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.4),
            ),
          ),
          const Spacer(),
          StreamBuilder<List<CommunityLikeModel>>(
            stream: context.read<AppCubit>().getCommentLikes(
                  postId: post.postId,
                  commentId: comment.commentId,
                ),
            builder: (context, snapshot) {
              final likes = snapshot.data ?? [];
              int likesCount = snapshot.data?.length ?? 0;
              final isLiked = likes.any((like) => like.uId == uId);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Icon(
                      isLiked ? IconBroken.Heart : IconBroken.Heart,
                      size: 18,
                      color: isLiked ? Colors.red : null,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$likesCount',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
