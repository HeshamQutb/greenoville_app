import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';

import '../../view_model/community_cubit/community_cubit.dart';
import 'community_post_list_view_item.dart';

class CommunityPostListView extends StatelessWidget {
  const CommunityPostListView({
    super.key,
    required this.appCubit,
    required this.communityCubit,
  });

  final AppCubit appCubit;
  final CommunityCubit communityCubit;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.only(top: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CommunityPostListViewItem(
            appCubit: appCubit,
            post: CommunityCubit.get(context).posts[index],
            communityCubit: communityCubit,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 2),
          itemCount: CommunityCubit.get(context).posts.length,
        );
      },
    );
  }
}
