import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/user_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  String role = S.current.farmer;

  void selectUserRole(String selectedRole) {
    role = selectedRole;
    emit(SelectUserRoleState(role));
  }

  String? uploadedImage;
  File? profileImage;

  Future<void> getProfileImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetUserImageSuccessState());
    } else {
      emit(GetUserImageErrorState());
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
      return null;
    }
  }

  Future<void> userSignUp({
    required String email,
    required String name,
    required String password,
    required String phone,
    required String role,
    required BuildContext context,
  }) async {
    emit(SignUpLoadingState());
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final imageURL = await uploadProfileImage();
      userCreate(
        email: email,
        name: name,
        password: password,
        phone: phone,
        uId: userCredential.user!.uid,
        image: imageURL ??
            'https://erollaw.com/wp-content/uploads/2021/03/unknown.png',
        role: role,
      );
      CacheHelper.setData(
        key: 'uId',
        value: FirebaseAuth.instance.currentUser?.uid,
      );
      uId = CacheHelper.getData(key: 'uId');
      await sendEmailVerification();
      emit(SignUpSuccessState());
    } catch (error) {
      String errorMessage = S.of(context).defaultSignUpFailed;
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'weak-password':
            errorMessage = S.of(context).weakPassword;
            break;
          case 'email-already-in-use':
            errorMessage = S.of(context).emailAlreadyInUse;
            break;
          case 'invalid-email':
            errorMessage = S.of(context).invalidEmail;
            break;
          default:
            errorMessage = S.of(context).defaultSignUpFailed;
        }
      }
      emit(SignUpErrorState(errorMessage));
    }
  }

  void userCreate({
    required String email,
    required String name,
    required String password,
    required String phone,
    required String uId,
    required String image,
    required String role,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      image: image,
      role: role,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((_) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      emit(SendEmailVerificationSuccessState());
    } catch (error) {
      emit(SendEmailVerificationErrorState(error.toString()));
    }
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword == true
        ? suffix = Icons.visibility_off
        : suffix = Icons.visibility;
    emit(SignUpChangePasswordVisibilityState());
  }
}
