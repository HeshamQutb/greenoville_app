import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';
import 'community_post_list_view.dart';

class CommunityPostListViewBuilder extends StatelessWidget {
  const CommunityPostListViewBuilder({
    super.key,
    required this.appCubit,
    required this.future,
  });

  final AppCubit appCubit;
  final Future<List<CommunityPostModel>> future;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CommunityPostModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text('${S.of(context).error} ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(S.of(context).noPostsAvailable),
            ),
          );
        } else {
          return CommunityListView(
            posts: snapshot.data!,
            appCubit: appCubit,
          );
        }
      },
    );
  }
}
