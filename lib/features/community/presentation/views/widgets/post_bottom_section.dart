import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_states.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';

class PostBottomSection extends StatelessWidget {
  const PostBottomSection({
    super.key,
    required this.appCubit,
    required this.post,
  });
  final AppCubit appCubit;
  final CommunityPostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        // if (appCubit.userModel == null) {
        //   // Show a loading indicator while user data is being fetched
        //   return const Center(child: CircularProgressIndicator());
        // }

        return StreamBuilder<List<CommunityLikeModel>>(
          stream: appCubit.getLikes(
            postId: post.postId,
          ),
          builder: (context, snapshot) {
            final likes = snapshot.data ?? [];
            final isLiked = likes.any((like) => like.uId == uId);
            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          kUserModel!.userImage,
                        ),
                        radius: 20,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    appCubit.likePost(
                      postId: post.postId,
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? IconBroken.Heart : IconBroken.Heart,
                        size: 20,
                        color: isLiked ? Colors.red : null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).like,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
