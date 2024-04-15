import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/community/presentation/view_model/community_cubit/community_cubit.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import 'widgets/community_view_body.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    return BlocBuilder<CommunityCubit, dynamic>(
      builder: (context, state)
      {
        var communityCubit = CommunityCubit.get(context);
        return Column(
          children: [
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: CommunityViewBody(
                    appCubit: appCubit,
                    communityCubit: communityCubit,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
