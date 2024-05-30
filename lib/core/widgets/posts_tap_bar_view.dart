import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/app_cubit/app_states.dart';
import '../../features/community/data/models/community_post_model.dart';
import '../../features/community/presentation/views/widgets/community_view_body.dart';

class PostsTapBarView extends StatelessWidget {
  const PostsTapBarView({
    super.key,
    required this.future,
  });
  final Future<List<CommunityPostModel>> future;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  CommunityViewBody(
                    appCubit: appCubit,
                    future: future,
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
