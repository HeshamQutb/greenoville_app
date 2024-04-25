import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_post_model.dart';
import 'likes_list_view_builder.dart';

class LikesViewBody extends StatelessWidget {
  const LikesViewBody({
    super.key,
    required this.appCubit,
    required this.post,
  });
  final AppCubit appCubit;
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
                appCubit: appCubit,
                post: post,
              )
            ],
          ),
        ),
      ],
    );
  }
}
