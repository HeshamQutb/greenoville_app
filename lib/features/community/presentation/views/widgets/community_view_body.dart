import 'package:flutter/material.dart';
import 'package:greenoville_app/features/community/presentation/view_model/community_cubit/community_cubit.dart';
import 'package:greenoville_app/features/community/presentation/views/widgets/community_view_custom_app_bar.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import 'community_post_list_view.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({
    super.key,
    required this.appCubit,
    required this.communityCubit,
  });
  final AppCubit appCubit;
  final CommunityCubit communityCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommunityViewCustomAppBar(
          appCubit: appCubit,
        ),
        CommunityPostListView(
          appCubit: appCubit,
          communityCubit: communityCubit,
        ),
      ],
    );
  }
}
