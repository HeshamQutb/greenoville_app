import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../view_model/edit_post_cubit/edit_post_cubit.dart';

class EditPostBottomSection extends StatelessWidget {
  const EditPostBottomSection({
    super.key,
    required this.textController,
    required this.userModel,
    required this.postId,
    required this.timestamp,
    required this.postImage,
    this.description,
    required this.postImageDelete,
  });

  final TextEditingController textController;
  final UserModel? userModel;
  final Timestamp timestamp;
  final String postId;
  final String? description;
  final String postImage;
  final String postImageDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              EditPostCubit.get(context).getPostImageGallery(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(IconBroken.Image),
                const SizedBox(
                  width: 10,
                ),
                Text(S.of(context).addPhoto),
              ],
            ),
          ),
        ),
        Expanded(
            child: TextButton(
          onPressed: () {
            // Check if the description or the image has changed
            bool hasTextChanged = textController.text != description;
            bool hasImageChanged =
                EditPostCubit.get(context).postImage != null || postImage != '';
            bool hasImageRemoved = postImage == '';

            // Check if the text or the image needs to be updated
            if (hasTextChanged || hasImageChanged || hasImageRemoved) {
              if (hasImageChanged) {
                // If the image has changed, upload the new image
                EditPostCubit.get(context).uploadPostImage(
                  timestamp: timestamp,
                  description: textController.text,
                  context: context,
                  uId: userModel!.uId,
                  postId: postId,
                );
              } else if (hasTextChanged || hasImageRemoved) {
                // If only the text has changed, update the existing post
                EditPostCubit.get(context).deletePostImage(postId: postId);
                EditPostCubit.get(context).editExistingPost(
                  timestamp: timestamp,
                  description: textController.text,
                  context: context,
                  uId: userModel!.uId,
                  postId: postId,
                  postImage: postImage,
                );
              }
            } else {
              showToast(
                message: S.of(context).noThing,
                state: ToastState.warning,
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(IconBroken.Send),
              const SizedBox(
                width: 10,
              ),
              Text(S.of(context).edit),
            ],
          ),
        ))
      ],
    );
  }
}
