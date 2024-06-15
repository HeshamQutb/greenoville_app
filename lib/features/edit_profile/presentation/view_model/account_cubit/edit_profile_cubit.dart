import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../auth/data/models/user_model.dart';
import 'edit_profile_states.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitState());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  File? newProfileImage;
  File? newCoverImage;

  final picker = ImagePicker();

  Future<void> pickProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      newProfileImage = File(pickedFile.path);
      emit(EditProfileUserImagePickedState());
    }
  }

  Future<void> pickCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      newCoverImage = File(pickedFile.path);
      emit(EditProfileCoverImagePickedState());
    }
  }

  void updateUserProfile({
    required String userName,
    required String userPhone,
    required String userEmail,
    required String uId,
    required String bio,
    required String? userImage,
    required String? coverImage,
    required String userRole,
    required bool isVerified,
    required bool hasFarm,
    required bool hasTips,
  }) async {
    emit(EditProfileLoadingState());

    String? profileImageUrl;
    String? coverImageUrl;

    if (newProfileImage != null) {
      profileImageUrl =
          await _uploadImage(newProfileImage!, 'profile_images/$uId');
    }

    if (newCoverImage != null) {
      coverImageUrl = await _uploadImage(newCoverImage!, 'cover_images/$uId');
    }

    UserModel updatedUser = UserModel(
      userName: userName,
      userPhone: userPhone,
      userEmail: userEmail,
      uId: uId,
      bio: bio,
      userImage: profileImageUrl ?? userImage!,
      coverImage: coverImageUrl ?? coverImage!,
      userRole: userRole,
      isVerified: isVerified,
      hasFarm: hasFarm,
      hasTips: hasTips,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(updatedUser.toMap())
        .then((value) {
      emit(EditProfileSuccessState(updatedUser));
    }).catchError((error) {
      emit(EditProfileErrorState(error.toString()));
    });
  }

  Future<String> _uploadImage(File image, String path) async {
    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(path).putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
