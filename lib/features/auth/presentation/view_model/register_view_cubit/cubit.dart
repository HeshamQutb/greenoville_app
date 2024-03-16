// ignore_for_file: avoid_print
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/register_view_cubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  String? uploadedImage;
  File? profileImage;
  Future<void> getProfileImageGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      profileImage = File(returnedImage.path);
      emit(GetUserImageSuccessState());
    } else {
      emit(GetUserImageErrorState());
      print('No image selected!');
    }
  }

  Future<void> getProfileImageCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage != null) {
      profileImage = File(returnedImage.path);
      emit(GetUserImageSuccessState());
    } else {
      emit(GetUserImageErrorState());
      print('No image selected!');
    }
  }

  Future<String?> uploadProfileImage() async {
    if (profileImage != null) {
      try {
        final TaskSnapshot uploadSnapshot = await FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!);

        final String imageURL = await uploadSnapshot.ref.getDownloadURL();
        emit(UploadUserImageSuccessState());
        return imageURL;
      } catch (error) {
        emit(UploadUserImageErrorState());
        return null;
      }
    } else {
      // If profile image is null, return a default image URL or handle as required
      return null;
    }
  }

  void userRegister({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uploadProfileImage().then((imageURL) {
        userCreate(
          email: email,
          name: name,
          password: password,
          phone: phone,
          uId: value.user!.uid,
          image: imageURL ?? 'https://erollaw.com/wp-content/uploads/2021/03/unknown.png',
        );
        print(value.user?.email);
        print(value.user?.uid);
        emit(RegisterSuccessState());
      }).catchError((error) {
        emit(RegisterErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String password,
    required String phone,
    required String uId,
    required String image,
  }) {
    UserModel model = UserModel(
      name = name,
      phone = phone,
      email = email,
      uId = uId,
      image =image,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword == true
        ? suffix = Icons.visibility
        : suffix = Icons.visibility_off;
    emit(RegisterChangePasswordVisibilityState());
  }

}
