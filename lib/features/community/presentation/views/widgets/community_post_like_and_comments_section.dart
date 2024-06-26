import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/community/presentation/views/likes_view.dart';
import 'package:greenoville_app/features/community/presentation/views/post_view.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';

class CommunityPostLikesAndCommentsSection extends StatelessWidget {
  const CommunityPostLikesAndCommentsSection({
    super.key,
    required this.post,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: StreamBuilder<List<CommunityLikeModel>>(
              stream:
                  context.read<CommunityCubit>().getLikes(postId: post.postId),
              builder: (context, snapshot) {
                int likesCount = snapshot.data?.length ?? 0;
                return InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      LikesView(
                        post: post,
                        communityCubit: communityCubit,
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
            child: StreamBuilder<int>(
              stream: communityCubit.getTotalCommentsAndReplies(
                  postId: post.postId),
              builder: (context, snapshot) {
                int totalCommentsAndReplies = snapshot.data ?? 0;
                return InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      PostView(
                        autofocus: false,
                        post: post,
                        communityCubit: communityCubit,
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
                          '$totalCommentsAndReplies ${S.of(context).comment}',
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
