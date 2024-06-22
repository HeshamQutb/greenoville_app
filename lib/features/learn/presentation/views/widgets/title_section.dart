import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

import '../../../../../generated/l10n.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.widget,
    required this.appCubit,
  });
  final String title;
  final Widget widget;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        InkWell(
          onTap: () {
            navigateTo(context, widget);
          },
          child: Text(
            S.of(context).seeAll,
            style: TextStyle(
              color: Colors.green,
              fontSize: appCubit.isArabic() ? 20 : null,
            ),
          ),
        ),
      ],
    );
  }
}
