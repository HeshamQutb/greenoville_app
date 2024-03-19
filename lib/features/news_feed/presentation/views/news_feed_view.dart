import 'package:flutter/material.dart';

import 'widgets/news_feed_view_body.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsFeedViewBody(),
    );
  }
}


