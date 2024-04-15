import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:intl/intl.dart';

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
              DateTime now = DateTime.now();
              String formattedDate = DateFormat('dd/MM/yyyy').format(now);
              String formattedTime = DateFormat('HH:mm a').format(now);
              if (textController.text != '') {
                if (AddPostCubit.get(context).postImage == null) {
                  AddPostCubit.get(context).addNewPost(
                    dateTime: formattedDate,
                    clockTime: formattedTime,
                    description: textController.text,
                    context: context,
                    name: userModel?.name,
                    uId: userModel?.uId,
                    image: userModel?.image,
                  );
                } else {
                  AddPostCubit.get(context).uploadPostImage(
                    dateTime: formattedDate,
                    clockTime: formattedTime,
                    description: textController.text,
                    context: context,
                    name: userModel?.name,
                    uId: userModel?.uId,
                    image: userModel?.image,
                  );
                }
              } else if (AddPostCubit.get(context).postImage != null) {
                if (AddPostCubit.get(context).postImage == null) {
                  AddPostCubit.get(context).addNewPost(
                    dateTime: formattedDate,
                    clockTime: formattedTime,
                    description: textController.text,
                    context: context,
                    name: userModel?.name,
                    uId: userModel?.uId,
                    image: userModel?.image,
                  );
                } else {
                  AddPostCubit.get(context).uploadPostImage(
                    dateTime: formattedDate,
                    clockTime: formattedTime,
                    description: textController.text,
                    context: context,
                    name: userModel?.name,
                    uId: userModel?.uId,
                    image: userModel?.image,
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
