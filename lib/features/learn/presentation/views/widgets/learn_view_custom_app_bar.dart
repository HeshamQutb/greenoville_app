import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';

class LearnViewCustomAppBar extends StatelessWidget {
  const LearnViewCustomAppBar({super.key,  this.appCubit});
  final AppCubit? appCubit;
  @override
  Widget build(BuildContext context) {
    return GradientText(
      fontSize: 23,
      text: S.of(context).learnTitle,
      colors: const [Colors.green, Colors.blue],
      left: 0.0,
      top: 0.0,
      width: 500.0,
      height: 70.0,
    );
  }
}
