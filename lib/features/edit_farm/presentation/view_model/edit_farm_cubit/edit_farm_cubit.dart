import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../generated/l10n.dart';
import '../../../../create_farm/data/models/farm_model.dart';
import 'edit_farm_states.dart';

class EditFarmCubit extends Cubit<EditFarmStates> {
  EditFarmCubit() : super(EditFarmInitialState());

  static EditFarmCubit get(context) => BlocProvider.of(context);

  void editFarm({
    required BuildContext context,
    required String uId,
    String? farmImage,
    required String farmName,
    required String farmOwnerName,
    required String farmLocation,
    required bool hasProducts,
  }) {
    emit(EditFarmLoadingState());
    FarmModel farmModel = FarmModel(
      uId: uId,
      farmImage: farmImage ?? AssetsData.noUserImage,
      farmName: farmName,
      farmOwnerName: farmOwnerName,
      farmLocation: farmLocation,
      hasProducts: hasProducts,
    );
    FirebaseFirestore.instance
        .collection('farms')
        .doc(uId)
        .set(farmModel.toMap())
        .then((value) {
      emit(EditFarmSuccessState());
    }).catchError((error) {
      emit(EditFarmErrorState(error.toString()));
    });
  }

  File? farmImage;
  String cropper = S.current.cropper;

  Future<void> getFarmImage({
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
              toolbarTitle: cropper,
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              cropStyle: CropStyle.circle,
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
          farmImage = File(croppedFile.path);
          emit(GetFarmImageSuccessState());
        } else {
          // User canceled cropping
          emit(GetFarmImageCancelledState()); // New state for user cancellation
        }
      } on Exception catch (e) {
        // Handle any exceptions that might occur during cropping
        debugPrint('Error cropping image: $e');
        emit(GetFarmImageErrorState());
      }
    } else {
      emit(GetFarmImageCancelledState());
    }
  }

  void uploadFarmImage({
    required BuildContext context,
    required String uId,
    required String farmName,
    required String farmOwnerName,
    required String farmLocation,
    required String farmId,
    required bool hasProducts,
    required String currentFarmImageUrl, // Add current image URL parameter
  }) {
    emit(EditFarmLoadingState());
    if (farmImage != null) {
      FirebaseStorage.instance
          .ref()
          .child('farms/$farmId')
          .putFile(farmImage!)
          .then((value) {
        value.ref.getDownloadURL().then((imageUrl) {
          editFarm(
            context: context,
            uId: uId,
            farmImage: imageUrl,
            farmName: farmName,
            farmOwnerName: farmOwnerName,
            farmLocation: farmLocation,
            hasProducts: hasProducts,
          );
        }).catchError((error) {
          emit(EditFarmErrorState(error.toString()));
        });
      }).catchError((error) {
        emit(EditFarmErrorState(error.toString()));
      });
    } else {
      // Use the current image URL if no new image is selected
      editFarm(
        context: context,
        uId: uId,
        farmImage: currentFarmImageUrl,
        farmName: farmName,
        farmOwnerName: farmOwnerName,
        farmLocation: farmLocation,
        hasProducts: hasProducts,
      );
    }
  }

  void removeFarmImage() {
    farmImage = null;
    emit(RemoveFarmImageSuccessState());
  }
}
