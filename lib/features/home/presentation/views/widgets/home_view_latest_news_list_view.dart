import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/latest_news_list_view_item.dart';

import '../../../../../core/models/articles_model.dart';

class HomeViewLatestNewsListView extends StatelessWidget {
  const HomeViewLatestNewsListView({
    super.key,
    required this.articles,
  });
  final List<ArticlesModel> articles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 670,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) => LatestNewsListViewItem(
          articlesModel: articles[index],
        ),
      ),
    );
  }
}
