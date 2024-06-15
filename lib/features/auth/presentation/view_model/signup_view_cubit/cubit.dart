import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/states.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/user_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  String defaultSignUpFailed = S.current.defaultSignUpFailed;
  String weakPassword = S.current.weakPassword;
  String emailAlreadyInUse = S.current.emailAlreadyInUse;
  String invalidEmail = S.current.invalidEmail;

  String role = S.current.farmer;

  void selectUserRole(String selectedRole) {
    role = selectedRole;
    emit(SelectUserRoleState(role));
  }

  File? profileImage;
  String cropper = S.current.cropper;
  Future<void> getProfileImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      try {
        final croppedFile = await ImageCropper.platform.cropImage(
          sourcePath: pickedFile.path,
          uiSettings: [
            AndroidUiSettings(
              cropStyle: CropStyle.circle,
              toolbarTitle: cropper,
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
          profileImage = File(croppedFile.path);
          emit(GetUserImageSuccessState());
        } else {
          // User canceled cropping
          emit(GetUserImageCancelledState()); // New state for user cancellation
        }
      } on Exception catch (e) {
        // Handle any exceptions that might occur during cropping
        debugPrint('Error cropping image: $e'); // Log for debugging
        emit(GetUserImageErrorState());
      }
    } else {
      emit(GetUserImageCancelledState());
    }
  }

  void removeProfileImage() {
    profileImage = null;
    emit(RemoveUserImageSuccessState());
  }

  Future<String?> uploadProfileImage({required String uId}) async {
    if (profileImage != null) {
      try {
        final TaskSnapshot uploadSnapshot = await FirebaseStorage.instance
            .ref()
            .child('profile_images/$uId')
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
    required String userName,
    required String userPhone,
    required String userEmail,
    required String userRole,
    required String password,
    required BuildContext context,
  }) async {
    emit(SignUpLoadingState());
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);
      final imageURL = await uploadProfileImage(uId: userCredential.user!.uid);
      userCreate(
        userName: userName,
        userPhone: userPhone,
        userEmail: userEmail,
        uId: userCredential.user!.uid,
        userImage: imageURL ?? AssetsData.noUserImage,
        userRole: userRole,
        isVerified: false,
        password: password,
        coverImage: AssetsData.noImage,
      );
      CacheHelper.setData(
        key: 'uId',
        value: FirebaseAuth.instance.currentUser?.uid,
      );
      uId = CacheHelper.getData(key: 'uId');
      await sendEmailVerification();
      emit(SignUpSuccessState());
    } catch (error) {
      String errorMessage = defaultSignUpFailed;
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'weak-password':
            errorMessage = weakPassword;
            break;
          case 'email-already-in-use':
            errorMessage = emailAlreadyInUse;
            break;
          case 'invalid-email':
            errorMessage = invalidEmail;
            break;
          default:
            errorMessage = defaultSignUpFailed;
        }
      }
      emit(SignUpErrorState(errorMessage));
    }
  }

  void userCreate({
    required String userName,
    required String userPhone,
    required String userEmail,
    required String uId,
    required String userImage,
    required String coverImage,
    required String userRole,
    required bool isVerified,
    required String password,
  }) {
    UserModel userModel = UserModel(
      userName: userName,
      userPhone: userPhone,
      userEmail: userEmail,
      uId: uId,
      userImage: userImage,
      coverImage: coverImage,
      userRole: userRole,
      isVerified: isVerified,
      bio: 'bio',
      hasFarm: false,
      hasTips: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
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
