import 'package:flutter/material.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_news_feed_list_view_item.dart';

class NewsFeedListView extends StatelessWidget {
  const NewsFeedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const HomeViewNewsFeedListViewItem(
        title: 'New Farming Techniques',
        content: 'Explore the latest sustainable farming methods.',
        image:
        'assets/images/agricultural-workers.jpg', // Placeholder image, replace with actual asset
      ),
    );
  }
}