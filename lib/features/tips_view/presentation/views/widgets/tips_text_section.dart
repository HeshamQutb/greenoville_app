import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';

import '../../../../../generated/l10n.dart';

class TipsTextSection extends StatelessWidget {
  const TipsTextSection({
    super.key,
    required this.tip,
  });
  final TipsModel tip;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      tip.description,
      expandText: S.of(context).expandText,
      collapseText: S.of(context).collapseText,
      maxLines: 4,
      style: const TextStyle(fontSize: 14.0),
      linkColor: kPrimaryColor,
    );
  }
}
