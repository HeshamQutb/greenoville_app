import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/post_model.dart';
import 'add_post_states.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  void addNewPost({
    required BuildContext context,
    required String uId,
    String? postImage,
    required Timestamp timestamp,
    String? description,
    required String postId,
  }) {
    emit(AddPostLoadingState());
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
        .set(postModel.toMap())
        .then((value) {
      emit(AddPostSuccessState());
    }).catchError((error) {
      emit(AddPostErrorState(error.toString()));
    });
  }

  File? postImage;
  Future<void> getPostImageGallery(context) async {
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
        // Handle any exceptions that might occur during cropping
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
    emit(AddPostLoadingState());

    FirebaseStorage.instance
        .ref()
        .child('posts_images/$postId')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((imageUrl) {
        addNewPost(
          context: context,
          uId: uId,
          postImage: imageUrl,
          timestamp: timestamp,
          description: description,
          postId: postId,
        );
      }).catchError((error) {
        emit(AddPostErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(AddPostErrorState(error.toString()));
    });
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageSuccessState());
  }
}
