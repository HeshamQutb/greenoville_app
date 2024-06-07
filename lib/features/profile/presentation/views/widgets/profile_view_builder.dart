import 'package:flutter/material.dart';
import 'package:greenoville_app/features/profile/presentation/views/widgets/profile_view_header.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/posts_tap_bar_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../community/data/models/community_post_model.dart';
import '../../../../market/data/market_farm_model.dart';

class ProfileViewBuilder extends StatelessWidget {
  const ProfileViewBuilder({
    super.key,
    required this.futureUser,
    required this.tabController,
    required this.futurePosts,
    required this.futureFarms,
  });
  final TabController tabController;
  final Future<UserModel> futureUser;
  final Future<List<CommunityPostModel>> futurePosts;
  final Future<List<MarketFarmModel>> futureFarms;
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
                        const DefaultButton(
                          iconColor: Colors.white,
                          icon: IconBroken.Message,
                          text: 'Message',
                        ),
                        const SizedBox(height: 16),
                        TabBar(
                          labelColor: kPrimaryColor,
                          indicatorColor: kPrimaryColor,
                          controller: tabController,
                          tabs: snapshot.data!.userRole == S.of(context).farmer
                              ? const [
                                  Tab(text: 'Posts'),
                                  Tab(text: 'Farm'),
                                ]
                              : const [
                                  Tab(text: 'Posts'),
                                  Tab(text: 'Tips'),
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
                        const Center(
                          child: Text(
                            'Farm Information',
                          ),
                        ),
                      ]
                    : [
                        PostsTapBarView(
                          future: futurePosts,
                        ),
                        const Center(
                          child: Text(
                            'Expert Tips',
                          ),
                        ),
                      ],
              ),
            ),
          );
        }
      },
    );
  }
}
