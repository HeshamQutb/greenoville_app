import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/features/edit_post/presentation/views/widgets/edit_post_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/edit_post_cubit/edit_post_cubit.dart';
import '../view_model/edit_post_cubit/edit_post_states.dart';

class EditPostView extends StatefulWidget {
  const EditPostView({
    super.key,
    required this.postId,
    this.postImage,
    required this.timestamp,
    this.description,
  });
  final String? postImage;
  final Timestamp timestamp;
  final String? description;
  final String postId;

  @override
  State<EditPostView> createState() => _EditPostViewState();
}

class _EditPostViewState extends State<EditPostView> {
  late TextEditingController textController = TextEditingController();
  late String? postImage = widget.postImage;
  @override
  void initState() {
    super.initState();
    textController.text = widget.description ?? '';
  }

  void removePostImage() {
    setState(() {
      postImage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditPostCubit(),
      child: BlocConsumer<EditPostCubit, EditPostStates>(
        listener: (context, state) {
          if (state is EditPostSuccessState) {
            Navigator.pop(context, true);
            showToast(
              message: S.of(context).successfullyEditPost,
              state: ToastState.success,
            );

          }
        },
        builder: (context, state) {
          EditPostCubit editPostCubit = EditPostCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).editPost,
              leadingAction: () {
                Navigator.pop(context, false);
              },
            ),
            body: EditPostViewBody(
              textController: textController,
              state: state,
              postImage: postImage,
              postImageDelete: widget.postImage,
              description: widget.description,
              timestamp: widget.timestamp,
              postId: widget.postId,
              editPostCubit: editPostCubit,
              removePostImage: removePostImage,
            ),
          );
        },
      ),
    );
  }
}
