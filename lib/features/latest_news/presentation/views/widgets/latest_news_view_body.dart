import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';

import '../../../../../generated/l10n.dart';
import 'latest_news_list_view.dart';

class LatestNewsViewBody extends StatelessWidget {
  const LatestNewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: S.of(context).latestNews,
          leadingAction: () {
            Navigator.pop(context);
          },
        ),
        const Expanded(child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: LatestNewsListView(),
        )),
      ],
    );
  }
}
