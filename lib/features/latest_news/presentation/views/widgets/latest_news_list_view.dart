import 'package:flutter/material.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_latest_news_list_view_item.dart';

class LatestNewsListView extends StatelessWidget {
  const LatestNewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const HomeViewLatestNewsListViewItem(
        title: 'New Farming Techniques',
        content: 'Explore the latest sustainable farming methods.',
        image:
        'assets/images/agricultural-workers.jpg', // Placeholder image, replace with actual asset
      ),
    );
  }
}