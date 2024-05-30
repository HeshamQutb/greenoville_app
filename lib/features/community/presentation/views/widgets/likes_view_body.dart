import 'package:flutter/material.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'likes_list_view_builder.dart';

class LikesViewBody extends StatelessWidget {
  const LikesViewBody({
    super.key,
    required this.post,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              LikesListViewBuilder(
                post: post,
                communityCubit: communityCubit,
              )
            ],
          ),
        ),
      ],
    );
  }
}
