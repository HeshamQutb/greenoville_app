import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/news_feed/presentation/views/widgets/news_feed_list_view.dart';

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
        const Expanded(child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: NewsFeedListView(),
        )),
      ],
    );
  }
}
