import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/icon_broken.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/features/profile/presentation/views/widgets/profile_view_header.dart';

import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/widgets/posts_tap_bar_view.dart';
import '../../../../generated/l10n.dart';
import '../../../community/data/models/community_post_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    required this.post,
  });
  final CommunityPostModel post;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<CommunityPostModel>> future;

  @override
  void initState() {
    super.initState();
    future = AppCubit.get(context).getPosts(uid: widget.post.uId);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  children: [
                    ProfileViewHeader(
                      post: widget.post,
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
                      controller: _tabController,
                      tabs: widget.post.userRole == S.of(context).farmer
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
            controller: _tabController,
            children: widget.post.userRole == S.of(context).farmer
                ? [
                    PostsTapBarView(
                      future: future,
                    ),
                    const Center(
                      child: Text(
                        'Farm Information',
                      ),
                    ),
                  ]
                : [
                    PostsTapBarView(
                      future: future,
                    ),
                    const Center(
                      child: Text(
                        'Expert Tips',
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
