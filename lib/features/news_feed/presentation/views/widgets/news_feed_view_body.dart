import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';

class NewsFeedViewBody extends StatelessWidget {
  const NewsFeedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'News Feed',
          leadingAction: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
