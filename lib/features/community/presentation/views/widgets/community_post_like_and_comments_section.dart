import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/community/data/models/community_comment_model.dart';
import 'package:greenoville_app/features/community/presentation/views/likes_view.dart';
import 'package:greenoville_app/features/community/presentation/views/post_view.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';

class CommunityPostLikesAndCommentsSection extends StatelessWidget {
  const CommunityPostLikesAndCommentsSection(
      {super.key, required this.post, required this.appCubit});
  final CommunityPostModel post;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: StreamBuilder<List<CommunityLikeModel>>(
              stream: context.read<AppCubit>().getLikes(postId: post.postId),
              builder: (context, snapshot) {
                int likesCount = snapshot.data?.length ?? 0;
                return InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      LikesView(
                        appCubit: appCubit,
                        post: post,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          size: 15,
                          color: Colors.red,
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
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<CommunityCommentModel>>(
              stream: context.read<AppCubit>().getComments(postId: post.postId),
              builder: (context, snapshot) {
                int commentsCount = snapshot.data?.length ?? 0;
                return InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      PostView(
                        autofocus: false,
                        appCubit: appCubit,
                        post: post,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          IconBroken.Chat,
                          size: 15,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$commentsCount ${S.of(context).comment}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
