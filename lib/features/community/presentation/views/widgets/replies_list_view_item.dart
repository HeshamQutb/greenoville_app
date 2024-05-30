import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
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
              InkWell(
                onTap: (){
                  navigateTo(
                    context,
                    replay.uId == uId
                        ? AccountView(appCubit: appCubit,)
                        : ProfileView(
                      post: post,
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    replay.userImage,
                  ),
                  radius: 25,
                ),
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
