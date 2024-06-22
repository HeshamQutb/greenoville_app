import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/featured_articles_cubit/featured_articles_cubit.dart';
import 'widgets/featured_articles_view_body.dart';

class FeaturedArticlesView extends StatelessWidget {
  const FeaturedArticlesView({super.key});

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
              title: S.of(context).featuredArticles,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  FeaturedArticlesViewBody(
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
