import 'package:flutter/material.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';

class MarketViewCustomAppBar extends StatelessWidget {
  const MarketViewCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientText(
        fontSize: 23,
        text: S.of(context).marketTitle,
        colors: const [Colors.green, Colors.blue],
        left: 0.0,
        top: 0.0,
        width: 500.0,
        height: 70.0,
      ),
    );
  }
}
