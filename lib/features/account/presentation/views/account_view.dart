import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/account/presentation/views/widgets/account_view_header.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../generated/l10n.dart';
import '../../../community/data/models/community_post_model.dart';
import '../../../profile/presentation/views/widgets/posts_tap_bar_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<CommunityPostModel>> future;
  @override
  void initState() {
    super.initState();
    future = AppCubit.get(context).getPosts(uid: uId);
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
                    AccountViewHeader(
                      coverPictureUrl: kUserModel!.coverImage,
                      profilePictureUrl: kUserModel!.userImage,
                      name: kUserModel!.userName,
                      isVerified: kUserModel!.isVerified,
                      bio: kUserModel!.bio,
                    ),
                    const SizedBox(height: 16),
                    const DefaultButton(
                      iconColor: Colors.white,
                      icon: Icons.edit,
                      text: 'edit profile',
                    ),
                    const SizedBox(height: 16),
                    TabBar(
                      labelColor: kPrimaryColor,
                      indicatorColor: kPrimaryColor,
                      controller: _tabController,
                      tabs: kUserModel!.userRole ==
                              S.of(context).farmer
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
            children:
                kUserModel!.userRole == S.of(context).farmer
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
