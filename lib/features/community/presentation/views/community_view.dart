import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import '../../data/models/community_post_model.dart';
import '../view_model/community_cubit/community_cubit.dart';
import '../view_model/community_cubit/community_states.dart';
import 'widgets/community_view_body.dart';
import 'widgets/community_view_custom_app_bar.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  late Future<List<CommunityPostModel>> future;

  @override
  void initState() {
    super.initState();
    future = CommunityCubit.get(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()..getPosts(),
      child: BlocConsumer<CommunityCubit, CommunityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var communityCubit = CommunityCubit.get(context);
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: CommunityViewCustomAppBar(),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      future = communityCubit.getPosts();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                    ),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        CommunityViewBody(
                          communityCubit: communityCubit,
                          future: future,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
