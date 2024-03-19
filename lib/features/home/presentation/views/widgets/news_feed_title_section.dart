import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/home/presentation/views/news_feed_view.dart';

class NewsFeedTitleSection extends StatelessWidget {
  const NewsFeedTitleSection(
      {super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
           navigateTo(context, const NewsFeedView());
          },
          child: const Text(
            'See all',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
