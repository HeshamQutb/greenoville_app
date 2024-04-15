import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/icon_broken.dart';
import 'package:greenoville_app/core/widgets/custom_text_field.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_bottom_section.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_comments.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_heading_section.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_image_section.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_like_and_comments_section.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/post_text_section.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../generated/l10n.dart';

class PostViewBody extends StatelessWidget {
  const PostViewBody({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PostHeadingSection(),
                const CustomDivider(
                  top: 12,
                  bottom: 12,
                ),
                const PostTextSection(),
                // if (postModel.postImage != '')
                const PostImageSection(),
                const PostLikesAndCommentsSection(),
                const CustomDivider(
                  bottom: 10,
                ),
                PostBottomSection(
                  appCubit: appCubit,
                ),
                const SizedBox(
                  height: 10,
                ),
                const PostComments(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: CustomTextField(
            controller: commentController,
            hintText: S.of(context).writeAComment,
            suffixIcon: IconBroken.Send,
            validator: (String? value) {
              return value.toString();
            },
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            autofocus: true,
            textAlignVertical: TextAlignVertical.top,
          ),
        )
      ],
    );
  }
}
