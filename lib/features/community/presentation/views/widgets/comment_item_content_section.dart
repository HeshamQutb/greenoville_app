import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/community/presentation/views/replay_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_post_model.dart';

class CommentItemContentSection extends StatelessWidget {
  const CommentItemContentSection(
      {super.key,
      required this.appCubit,
      required this.post,
      required this.comment});
  final AppCubit appCubit;
  final CommunityPostModel post;
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
          child: InkWell(
            onTap: () {
              navigateTo(
                context,
                ReplayView(
                  appCubit: appCubit,
                  post: post,
                  comment: comment,
                ),
              );
            },
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
      ),
    );
  }
}
