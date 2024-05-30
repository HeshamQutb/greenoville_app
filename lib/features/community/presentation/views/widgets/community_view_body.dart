import 'package:flutter/material.dart';
import '../../../data/models/community_post_model.dart';
import '../../view_model/community_cubit/community_cubit.dart';
import 'community_post_list_view_builder.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({
    super.key,
    required this.future,
    required this.communityCubit,
  });
  final CommunityCubit communityCubit;
  final Future<List<CommunityPostModel>> future;
  @override
  Widget build(BuildContext context) {
    return CommunityPostListViewBuilder(
      future: future,
      communityCubit: communityCubit,
    );
  }
}
