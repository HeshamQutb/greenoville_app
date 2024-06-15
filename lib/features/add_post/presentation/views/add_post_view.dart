import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/features/add_post/presentation/views/widgets/add_post_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_post_cubit/add_post_cubit.dart';
import '../view_model/add_post_cubit/add_post_states.dart';

class AddPostView extends StatelessWidget {
  AddPostView({super.key});
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddPostSuccessState) {
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
              title: S.of(context).addPost,
              leadingAction: () {
                Navigator.pop(context, false);
              },
            ),
            body: AddPostViewBody(
              textController: textController,
              state: state,
            ),
          );
        },
      ),
    );
  }
}
