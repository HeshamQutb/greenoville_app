import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/features/add_tips/presentation/view_model/add_tips_cubit/add_tips_cubit.dart';
import 'package:uuid/uuid.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';

class AddTipsBottomSection extends StatelessWidget {
  const AddTipsBottomSection({
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
          child: DefaultButton(
            onPressed: () {
              if (textController.text != '') {
                AddTipsCubit.get(context).addNewTips(
                  uId: userModel!.uId,
                  tipsId: const Uuid().v1(),
                  description: textController.text,
                );
              } else {
                showToast(
                  message: S.of(context).noThing,
                  state: ToastState.warning,
                );
              }
            },
            text: S.of(context).post,
          ),
        ),
      ],
    );
  }
}
