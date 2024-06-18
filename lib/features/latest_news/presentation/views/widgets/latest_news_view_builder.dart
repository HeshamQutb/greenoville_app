import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/articles_model.dart';
import '../../../../../core/widgets/news_error_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/latest_news_cubit/latest_news_cubit.dart';
import 'latest_news_list_view.dart';

class LatestNewsViewBuilder extends StatefulWidget {
  const LatestNewsViewBuilder({
    super.key,
    required this.category,
    required this.latestNewsCubit,
  });
  final String category;
  final LatestNewsCubit latestNewsCubit;

  @override
  State<LatestNewsViewBuilder> createState() => _LatestNewsViewBuilderState();
}

class _LatestNewsViewBuilderState extends State<LatestNewsViewBuilder> {
  dynamic future;

  @override
  void initState() {
    super.initState();
    future =
        widget.latestNewsCubit.getNews(category: widget.category, dio: Dio());
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
          return LatestNewsListView(
            articles: snapshot.data!,
          );
        }
      },
    );
  }
}
