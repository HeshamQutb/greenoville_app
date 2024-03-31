import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

import '../../../../../generated/l10n.dart';
import '../../../../latest_news/presentation/views/latest_news_view.dart';

class LatestNewsTitleSection extends StatelessWidget {
  const LatestNewsTitleSection(
      {super.key,
      required this.title,
      required this.widget,
      required this.appCubit});
  final String title;
  final Widget widget;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            navigateTo(context, const LatestNewsView());
          },
          child: Text(
            S.of(context).seeAll,
            style: TextStyle(
              color: Colors.green,
              fontSize: appCubit.isArabic() ? 24 : null,
            ),
          ),
        ),
      ],
    );
  }
}
