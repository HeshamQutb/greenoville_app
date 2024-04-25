import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Flexible(
            child: RadioListTile<String>(
              title: Text(S.of(context).arabic),
              value: 'ar',
              groupValue: appCubit.getAppLanguage() ?? 'ar',
              onChanged: (value) {
                appCubit.selectLanguage(selectedLanguage: value!);
              },
              contentPadding: EdgeInsets.zero,
              activeColor: kPrimaryColor,
            ),
          ),
          Flexible(
            child: RadioListTile<String>(
              title: Text(S.of(context).english),
              value: 'en',
              groupValue: appCubit.getAppLanguage() ?? 'ar',
              onChanged: (value) {
                appCubit.selectLanguage(selectedLanguage: value!);
              },
              contentPadding: EdgeInsets.zero,
              activeColor: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
