import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/format_time_stamp.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class RepliedCommentBottomSection extends StatelessWidget {
  const RepliedCommentBottomSection({
    super.key,
    required this.comment,
    required this.post,
    required this.communityCubit,
  });

  final CommunityCommentModel comment;
  final CommunityCubit communityCubit;
  final CommunityPostModel post;

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
              communityCubit.likeComment(
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
          const Spacer(),
          StreamBuilder<List<CommunityLikeModel>>(
            stream: context.read<CommunityCubit>().getCommentLikes(
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
