import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/product_model.dart';
import 'add_product_states.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);

  void addNewProduct({
    required BuildContext context,
    required String uId,
    String? productImage,
    required String productName,
    String? productDescription,
    required double productPrice,
    required String productUnit,
    required int productQuantity,
  }) {
    String productId = const Uuid().v1();
    emit(AddProductLoadingState());
    ProductModel productModel = ProductModel(
      productImage: productImage ?? AssetsData.noImage,
      productName: productName,
      productDescription: productDescription ?? '',
      productId: productId,
      productPrice: productPrice,
      productUnit: productUnit,
      productQuantity: productQuantity,
    );
    FirebaseFirestore.instance
        .collection('farms')
        .doc(uId)
        .collection('products')
        .doc(productId)
        .set(productModel.toMap())
        .then((value) {
      // Update hasProducts field in the farms collection
      FirebaseFirestore.instance
          .collection('farms')
          .doc(uId)
          .update({'hasProducts': true}).then((_) {
        emit(AddProductSuccessState());
      });
    }).catchError((error) {
      emit(AddProductErrorState(error.toString()));
    });
  }

  Future<File?> getProductImageGallery(context) async {
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
          return File(croppedFile.path);
        }
      } catch (e) {
        emit(GetProductImageErrorState());
      }
    }
    return null;
  }

  void addProductWithImage({
    required BuildContext context,
    required String uId,
    required String productName,
    required File productImage,
    String? productDescription,
    required double productPrice,
    required String productUnit,
    required int productQuantity,
  }) {
    emit(AddProductLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('products/${Uri.file(productImage.path).pathSegments.last}')
        .putFile(productImage)
        .then((value) {
      value.ref.getDownloadURL().then((imageUrl) {
        addNewProduct(
          context: context,
          uId: uId,
          productImage: imageUrl,
          productName: productName,
          productDescription: productDescription ?? '',
          productPrice: productPrice,
          productUnit: productUnit,
          productQuantity: productQuantity,
        );
      }).catchError((error) {
        emit(AddProductErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(AddProductErrorState(error.toString()));
    });
  }
}
