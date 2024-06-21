import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/chat/presentation/views/chat_view.dart';
import 'package:greenoville_app/features/profile/presentation/views/widgets/profile_view_header.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/posts_tap_bar_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../community/data/models/community_post_model.dart';
import '../../../../farm/presentation/views/farm_view.dart';
import '../../../../tips_view/presentation/views/tips_view.dart';

class ProfileViewBuilder extends StatelessWidget {
  const ProfileViewBuilder({
    super.key,
    required this.futureUser,
    required this.tabController,
    required this.futurePosts,
    required this.futureTips,
  });
  final TabController tabController;
  final Future<UserModel> futureUser;
  final Future<List<CommunityPostModel>> futurePosts;
  final Future<List<TipsModel>> futureTips;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${S.of(context).error} ${snapshot.error}'),
          );
        } else {
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                    ),
                    child: Column(
                      children: [
                        ProfileViewHeader(
                          userModel: snapshot.data!,
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            navigateTo(
                              context,
                              ChatView(friendID: snapshot.data!.uId),
                            );
                          },
                          child: DefaultButton(
                            iconColor: Colors.white,
                            icon: IconBroken.Message,
                            text: S.of(context).message,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TabBar(
                          labelColor: kPrimaryColor,
                          indicatorColor: kPrimaryColor,
                          controller: tabController,
                          tabs: snapshot.data!.userRole == S.of(context).farmer
                              ? [
                                  Tab(text: S.of(context).posts),
                                  Tab(text: S.of(context).farm),
                                ]
                              : [
                                  Tab(text: S.of(context).posts),
                                  Tab(text: S.of(context).tips),
                                ],
                        ),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: kHorizontalPadding,
              ),
              child: TabBarView(
                controller: tabController,
                children: snapshot.data!.userRole == S.of(context).farmer
                    ? [
                        PostsTapBarView(
                          future: futurePosts,
                        ),
                        FarmView(
                          uid: snapshot.data!.uId,
                          showAppBar: false,
                        )
                      ]
                    : [
                        PostsTapBarView(
                          future: futurePosts,
                        ),
                        TipsView(
                          uid: snapshot.data!.uId,
                          showAppBar: false,
                        )
                      ],
              ),
            ),
          );
        }
      },
    );
  }
}
