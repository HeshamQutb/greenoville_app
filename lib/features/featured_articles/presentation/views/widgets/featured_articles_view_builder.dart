import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/articles_model.dart';
import '../../../../../core/widgets/news_error_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/featured_articles_cubit/featured_articles_cubit.dart';
import 'featured_articles_list_view.dart';

class FeaturedArticlesBuilder extends StatefulWidget {
  const FeaturedArticlesBuilder({
    super.key,
    required this.latestNewsCubit,
  });

  final LatestNewsCubit latestNewsCubit;

  @override
  State<FeaturedArticlesBuilder> createState() =>
      _FeaturedArticlesBuilderState();
}

class _FeaturedArticlesBuilderState extends State<FeaturedArticlesBuilder> {
  dynamic future;

  @override
  void initState() {
    super.initState();
    future = widget.latestNewsCubit.getNews(dio: Dio());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: NewsErrorWidget(),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                S.of(context).noNewsAvailable,
              ),
            ),
          );
        } else {
          return FeaturedArticlesListView(
            articles: snapshot.data!,
          );
        }
      },
    );
  }
}
