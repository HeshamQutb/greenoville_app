import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../view_model/edit_post_cubit/edit_post_cubit.dart';
import '../../view_model/edit_post_cubit/edit_post_states.dart';
import 'edit_post_bottom_section.dart';
import 'edit_post_image_section.dart';
import 'edit_post_loading_section.dart';
import 'edit_post_text_section.dart';
import 'edit_post_user_info_section.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({
    super.key,
    required this.textController,
    required this.state,
    this.postImage,
    required this.timestamp,
    this.description,
    required this.postId,
    required this.editPostCubit,
    required this.removePostImage,
    this.postImageDelete,
  });
  final TextEditingController textController;
  final EditPostStates state;
  final EditPostCubit editPostCubit;
  final String? postImage;
  final String? postImageDelete;
  final Timestamp timestamp;
  final String? description;
  final String postId;
  final VoidCallback removePostImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        bottom: kHorizontalPadding,
      ),
      child: Column(
        children: [
          if (state is EditPostLoadingState) const EditPostLoadingSection(),
          EditPostUserInfoSection(
            userModel: kUserModel,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditPostTextSection(textController: textController),
                  const SizedBox(
                    height: 20,
                  ),
                  if (editPostCubit.postImage != null || postImage != '')
                    EditPostImageSection(
                      postImage: editPostCubit.postImage?.path ?? postImage,
                      removePostImage: removePostImage,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          EditPostBottomSection(
            textController: textController,
            userModel: kUserModel,
            postId: postId,
            description: description,
            timestamp: timestamp,
            postImage: postImage!,
            postImageDelete: postImage!,
          )
        ],
      ),
    );
  }
}
