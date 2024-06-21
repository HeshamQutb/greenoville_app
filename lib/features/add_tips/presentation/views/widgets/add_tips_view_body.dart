import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../view_model/add_tips_cubit/add_tips_states.dart';
import 'add_tips_bottom_section.dart';
import 'add_tips_loading_section.dart';
import 'add_tips_text_section.dart';
import 'add_tips_user_info_section.dart';

class AddTipsViewBody extends StatelessWidget {
  const AddTipsViewBody({
    super.key,
    required this.textController,
    required this.state,
  });
  final TextEditingController textController;
  final AddTipsStates state;
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
          if (state is AddTipsLoadingState) const AddTipsLoadingSection(),
          AddTipsUserInfoSection(
            userModel: kUserModel,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AddTipsTextSection(textController: textController),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AddTipsBottomSection(
            textController: textController,
            userModel: kUserModel,
          )
        ],
      ),
    );
  }
}
