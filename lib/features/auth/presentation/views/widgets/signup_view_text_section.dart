import 'package:flutter/material.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';

class SignUpViewTextSection extends StatelessWidget {
  const SignUpViewTextSection({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientText(
          text: S.of(context).newAccount,
          colors: const [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: appCubit.isArabic() ? 30 : 40,
        ),
        const SizedBox(
          height: 10.0,
        ),
        GradientText(
          text: S.of(context).joinGreeNovilleCommunity,
          colors: const [Colors.green, Colors.blue],
          left: 0,
          top: 0,
          width: 500,
          height: 0,
          fontSize: 14,
        ),
        GradientText(
          text: S.of(context).farmingPractices,
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
