import 'package:flutter/material.dart';

import 'widgets/latest_news_view_body.dart';

class LatestNewsView extends StatelessWidget {
  const LatestNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LatestNewsViewBody(),
    );
  }
}


