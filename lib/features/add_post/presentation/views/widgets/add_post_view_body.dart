import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../view_model/add_post_cubit/add_post_cubit.dart';
import '../../view_model/add_post_cubit/add_post_states.dart';
import 'add_post_bottom_section.dart';
import 'add_post_image_section.dart';
import 'add_post_loading_section.dart';
import 'add_post_text_section.dart';
import 'add_post_user_info_section.dart';

class AddPostViewBody extends StatelessWidget {
  const AddPostViewBody({
    super.key,
    required this.textController,
    required this.state,
  });
  final TextEditingController textController;
  final AddPostStates state;
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
          if (state is AddPostLoadingState) const AddPostLoadingSection(),
          AddPostUserInfoSection(
            userModel: kUserModel,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddPostTextSection(textController: textController),
                  const SizedBox(
                    height: 20,
                  ),
                  if (AddPostCubit.get(context).postImage != null)
                    const AddPostImageSection(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AddPostBottomSection(
            textController: textController,
            userModel: kUserModel,
          )
        ],
      ),
    );
  }
}
