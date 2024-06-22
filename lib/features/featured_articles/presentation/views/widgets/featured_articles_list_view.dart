import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/latest_news_list_view_item.dart';

import '../../../../../core/models/articles_model.dart';

class FeaturedArticlesListView extends StatelessWidget {
  const FeaturedArticlesListView({
    super.key,
    required this.articles,
  });
  final List<ArticlesModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return LatestNewsListViewItem(
            articlesModel: articles[index],
          );
        },
      ),
    );
  }
}
