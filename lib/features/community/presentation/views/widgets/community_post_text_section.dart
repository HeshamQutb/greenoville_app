import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';

class CommunityPostTextSection extends StatelessWidget {
  const CommunityPostTextSection({super.key, required this.post});
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      post.description,
      expandText: S.of(context).expandText,
      collapseText: S.of(context).collapseText,
      maxLines: 6,
      style: const TextStyle(fontSize: 14.0),
    );
  }
}
