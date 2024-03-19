import 'package:flutter/material.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_news_feed_list_view_item.dart';

class HomeViewNewsFeedListView extends StatelessWidget {
  const HomeViewNewsFeedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) => const HomeViewNewsFeedListViewItem(
          title: 'New Farming Techniques',
          content: 'Explore the latest sustainable farming methods.',
          image:
          'assets/images/agricultural-workers.jpg', // Placeholder image, replace with actual asset
        ),
      ),
    );
  }
}