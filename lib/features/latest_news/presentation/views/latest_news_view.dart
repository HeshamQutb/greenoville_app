import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/latest_news/presentation/view_model/latest_news_cubit/latest_news_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'widgets/latest_news_view_body.dart';

class LatestNewsView extends StatelessWidget {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LatestNewsCubit(),
      child: BlocConsumer<LatestNewsCubit, LatestNewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var latestNewsCubit = LatestNewsCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).latestNews,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  LatestNewsViewBody(
                    category: 'general',
                    latestNewsCubit: latestNewsCubit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
