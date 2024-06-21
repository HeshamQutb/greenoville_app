import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/features/add_tips/presentation/views/widgets/add_tips_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_tips_cubit/add_tips_cubit.dart';
import '../view_model/add_tips_cubit/add_tips_states.dart';

class AddTipsView extends StatelessWidget {
  const AddTipsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return BlocProvider(
      create: (context) => AddTipsCubit(),
      child: BlocConsumer<AddTipsCubit, AddTipsStates>(
        listener: (context, state) {
          if (state is AddTipsSuccessState) {
            Navigator.pop(context, true);
            showToast(
              message: S.of(context).successfullyPost,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).addTips,
              leadingAction: () {
                Navigator.pop(context, false);
              },
            ),
            body: AddTipsViewBody(
              textController: textController,
              state: state,
            ),
          );
        },
      ),
    );
  }
}
