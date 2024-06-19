import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_post/data/models/post_model.dart';
import 'edit_post_states.dart';

class EditPostCubit extends Cubit<EditPostStates> {
  EditPostCubit() : super(EditPostInitialState());

  static EditPostCubit get(context) => BlocProvider.of(context);

  File? postImage;

  Future<void> getPostImageGallery(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      try {
        final croppedFile = await ImageCropper.platform.cropImage(
          sourcePath: pickedFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: S.of(context).cropper,
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9,
              ],
            ),
            IOSUiSettings(
              minimumAspectRatio: 1.0,
            ),
          ],
        );
        if (croppedFile != null) {
          postImage = File(croppedFile.path);
          emit(GetPostImageSuccessState());
        } else {
          emit(GetPostImageCancelledState());
        }
      } catch (e) {
        emit(GetPostImageErrorState());
      }
    } else {
      emit(GetPostImageCancelledState());
    }
  }

  void uploadPostImage({
    required BuildContext context,
    required String uId,
    required Timestamp timestamp,
    String? description,
    required String postId,
  }) {
    emit(EditPostLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('posts_images/$postId')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((imageUrl) {
        editExistingPost(
          context: context,
          uId: uId,
          postImage: imageUrl,
          timestamp: timestamp,
          description: description,
          postId: postId,
        );
      }).catchError((error) {
        emit(EditPostErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(EditPostErrorState(error.toString()));
    });
  }

  void editExistingPost({
    required BuildContext context,
    required String uId,
    String? postImage,
    required Timestamp timestamp,
    String? description,
    required String postId,
  }) {
    emit(EditPostLoadingState());
    PostModel postModel = PostModel(
      uId: uId,
      postImage: postImage ?? '',
      timestamp: timestamp,
      description: description,
      postId: postId,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update(postModel.toMap())
        .then((value) {
      emit(EditPostSuccessState());
    }).catchError((error) {
      emit(EditPostErrorState(error.toString()));
    });
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageSuccessState());
  }

  void deletePostImage({
    required String postId,
  }) {
    try {
      FirebaseStorage.instance.ref().child('posts_images/$postId').delete();
      emit(DeletePostImageSuccessState());
    } catch (error) {
      emit(DeletePostImageErrorState('Failed to delete image: $error'));
    }
  }
}
