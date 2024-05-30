import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/community/data/models/community_post_model.dart';
import '../../features/community/presentation/view_model/community_cubit/community_cubit.dart';
import '../../features/community/presentation/view_model/community_cubit/community_states.dart';
import '../../features/community/presentation/views/widgets/community_view_body.dart';

class PostsTapBarView extends StatelessWidget {
  const PostsTapBarView({
    super.key,
    required this.future,
  });
  final Future<List<CommunityPostModel>> future;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityCubit, CommunityStates>(
      builder: (context, state) {
        var communityCubit = CommunityCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  CommunityViewBody(
                    future: future,
                    communityCubit: communityCubit,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
