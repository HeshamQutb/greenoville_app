import 'package:flutter/material.dart';
import '../../../../../core/models/articles_model.dart';
import 'learn_featured_articles_list_view_item.dart';

class LearnViewFeaturedArticlesListView extends StatelessWidget {
  const LearnViewFeaturedArticlesListView({
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
        itemBuilder: (context, index) => LearnViewFeaturedArticlesViewItem(
          articlesModel: articles[index],
        ),
      ),
    );
  }
}
