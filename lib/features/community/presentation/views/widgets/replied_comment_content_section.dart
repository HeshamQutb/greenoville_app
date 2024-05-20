import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';

class RepliedCommentContentSection extends StatelessWidget {
  const RepliedCommentContentSection({
    super.key,
    required this.comment,
  });

  final CommunityCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.userName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(height: 1.4),
                  ),
                  if (comment.isVerified == true)
                    const SizedBox(
                      width: 5,
                    ),
                  if (comment.isVerified == true)
                    const Icon(
                      Icons.check_circle_sharp,
                      color: Colors.blueAccent,
                      size: 13,
                    )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ExpandableText(
                comment.content,
                expandText: S.of(context).expandText,
                collapseText: S.of(context).collapseText,
                maxLines: 6,
                style: const TextStyle(fontSize: 13.0),
                linkColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}