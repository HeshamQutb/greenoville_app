import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/login_view_cubit/cubit.dart';

class LoginViewTextSection extends StatelessWidget {
  const LoginViewTextSection({super.key, required this.loginCubit, required this.appCubit});
  final LoginCubit loginCubit;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientText(
          text: S.of(context).login,
          colors: const [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: appCubit.isArabic() ? 30 : 50,
        ),
        const SizedBox(
          height: 8,
        ),
        GradientText(
          text: S.of(context).enterEmailPassword,
          colors: const [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: 14,
        ),
      ],
    );
  }
}
