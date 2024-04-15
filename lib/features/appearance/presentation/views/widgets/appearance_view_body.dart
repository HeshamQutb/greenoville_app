import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';


class AppearanceViewBody extends StatelessWidget {
  const AppearanceViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Flexible(
          child: RadioListTile<String>(
            title: Text(S.of(context).dark),
            value: S.of(context).dark,
            groupValue: S.of(context).dark,
            onChanged: (value) {

            },
            contentPadding: EdgeInsets.zero,
            activeColor: kPrimaryColor,
          ),
        ),
        Flexible(
          child: RadioListTile<String>(
            title: Text(S.of(context).light),
            value: S.of(context).light,
            groupValue: S.of(context).dark,
            onChanged: (value) {

            },
            contentPadding: EdgeInsets.zero,
            activeColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
