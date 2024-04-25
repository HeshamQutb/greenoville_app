import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_post_model.dart';

class PostTextSection extends StatelessWidget {
  const PostTextSection({super.key, required this.post});
  final CommunityPostModel post;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      post.description ?? '',
      expandText: S.of(context).expandText,
      collapseText: S.of(context).collapseText,
      maxLines: 4,
      style: const TextStyle(fontSize: 14.0),
      linkColor: kPrimaryColor,
    );
  }
}
