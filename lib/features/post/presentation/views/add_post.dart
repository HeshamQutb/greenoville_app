import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/features/post/presentation/view_model/add_post_cubit/add_post_cubit.dart';
import 'package:greenoville_app/features/post/presentation/view_model/add_post_cubit/add_post_states.dart';
import 'package:greenoville_app/features/post/presentation/views/widgets/add_post_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class AddPostView extends StatelessWidget {
  AddPostView({super.key, required this.appCubit});
  final textController = TextEditingController();
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddPostSuccessState) {
            Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
            body: AddPostViewBody(
              textController: textController,
              state: state,
              appCubit: appCubit,
            ),
          );
        },
      ),
    );
  }
}
