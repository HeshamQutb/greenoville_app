// ignore_for_file: avoid_print
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/post_model.dart';
import 'add_post_states.dart';

class AddPostCubit extends Cubit<AddPostStates> {
  AddPostCubit() : super(AddPostInitialState());

  static AddPostCubit get(context) => BlocProvider.of(context);

  void addNewPost({
    required BuildContext context,
    required String name,
    required String uId,
    required String image,
    required String dateTime,
    required String clockTime,
    required String description,
    dynamic postImage,
    dynamic likes,
    dynamic postId,
  }) {
    String postId = const Uuid().v1();
    emit(AddPostLoadingState());
    PostModel postModel = PostModel(
      name: name,
      uId: uId,
      image: image,
      postImage: postImage ?? '',
      dateTime: dateTime,
      clockTime: clockTime,
      description: description,
      likes: [],
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
        final croppedFile = await ImageCropper.platform
            .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ], uiSettings: [
          AndroidUiSettings(
            toolbarTitle: S.of(context).cropper,
            toolbarColor: kPrimaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ]);

        if (croppedFile != null) {
          postImage = File(croppedFile.path);
          emit(GetPostImageSuccessState());
        } else {
          emit(GetPostImageErrorState());
          print('Image cropping canceled');
        }
      } catch (e) {
        // Handle any exceptions that might occur during cropping
        emit(GetPostImageErrorState());
        print('Error during image cropping: $e');
      }
    } else {
      emit(GetPostImageErrorState());
      print('No image selected!');
    }
  }

  void uploadPostImage({
    required BuildContext context,
    dynamic name,
    dynamic uId,
    dynamic image,
    required dateTime,
    required clockTime,
    required description,
    dynamic likes,
    dynamic postId,
  }) {
    String postId = const Uuid().v1();
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        addNewPost(
          dateTime: dateTime,
          clockTime: clockTime,
          description: description,
          postImage: value,
          context: context,
          name: name,
          uId: uId,
          image: image,
          likes: [],
          postId: postId
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
