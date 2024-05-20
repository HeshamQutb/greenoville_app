import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/signup_view_cubit/cubit.dart';

class SelectUserRoleSection extends StatelessWidget {
  const SelectUserRoleSection({super.key, required this.signUpCubit});
  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: RadioListTile<String>(
            title: Text(S.of(context).farmer),
            value: S.of(context).farmer,
            groupValue: signUpCubit.role,
            onChanged: (value) {
              signUpCubit.selectUserRole(value!);
            },
            contentPadding: EdgeInsets.zero,
            activeColor: kPrimaryColor,
          ),
        ),
        Flexible(
          child: RadioListTile<String>(
            title: Text(S.of(context).expert),
            value: S.of(context).expert,
            groupValue: signUpCubit.role,
            onChanged: (value) {
              signUpCubit.selectUserRole(value!);
            },
            contentPadding: EdgeInsets.zero,
            activeColor: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}