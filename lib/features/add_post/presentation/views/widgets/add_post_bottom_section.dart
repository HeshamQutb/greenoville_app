import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../view_model/add_post_cubit/add_post_cubit.dart';

class AddPostBottomSection extends StatelessWidget {
  const AddPostBottomSection({
    super.key,
    required this.textController,
    required this.userModel,
  });

  final TextEditingController textController;
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              AddPostCubit.get(context).getPostImageGallery(context);
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
              if (textController.text != '') {
                if (AddPostCubit.get(context).postImage == null) {
                  AddPostCubit.get(context).addNewPost(
                    timestamp: Timestamp.now(),
                    description: textController.text,
                    context: context,
                    uId: userModel!.uId,
                  );
                } else {
                  AddPostCubit.get(context).uploadPostImage(
                    timestamp: Timestamp.now(),
                    description: textController.text,
                    context: context,
                    uId: userModel!.uId,
                  );
                }
              } else if (AddPostCubit.get(context).postImage != null) {
                if (AddPostCubit.get(context).postImage == null) {
                  AddPostCubit.get(context).addNewPost(
                    timestamp: Timestamp.now(),
                    description: textController.text,
                    context: context,
                    uId: userModel!.uId,
                  );
                } else {
                  AddPostCubit.get(context).uploadPostImage(
                    timestamp: Timestamp.now(),
                    description: textController.text,
                    context: context,
                    uId: userModel!.uId,
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
                Text(S.of(context).post),
              ],
            ),
          ),
        )
      ],
    );
  }
}
