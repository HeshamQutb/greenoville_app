import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_post_model.dart';
import 'community_post_list_view_builder.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({
    super.key,
    required this.appCubit,
    required this.future,
  });
  final AppCubit appCubit;
  final Future<List<CommunityPostModel>> future;
  @override
  Widget build(BuildContext context) {
    return CommunityPostListViewBuilder(
      appCubit: appCubit,
      future: future,
    );
  }
}
