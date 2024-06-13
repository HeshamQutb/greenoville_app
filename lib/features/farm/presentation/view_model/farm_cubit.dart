import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../create_farm/data/models/farm_model.dart';
import '../../data/farm_product_model.dart';
import 'farm_states.dart';

class FarmCubit extends Cubit<FarmStates> {
  FarmCubit() : super(FarmInitState());

  static FarmCubit get(context) => BlocProvider.of(context);


  Future<FarmModel?> getFarm({required String uid}) async {
    emit(FarmGetFarmLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('farms')
          .where('uId', isEqualTo: uid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Return null if there are no documents in the collection
        emit(FarmGetFarmSuccessState());
        return null;
      } else {
        var doc = querySnapshot.docs.first;
        var data = doc.data() as Map<String, dynamic>;
        var userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(data['uId'])
            .get();
        if (userDoc.data() != null) {
          var userData = userDoc.data() as Map<String, dynamic>;
          var farm = FarmModel.fromJson({
            ...data,
            'userName': userData['userName'],
            'userImage': userData['userImage'],
            'coverImage': userData['coverImage'],
            'userRole': userData['userRole'],
            'bio': userData['bio'],
            'isVerified': userData['isVerified'],
          });

          emit(FarmGetFarmSuccessState());
          return farm;
        } else {
          // If user data is not found, return null
          emit(FarmGetFarmSuccessState());
          return null;
        }
      }
    } catch (error) {
      emit(FarmGetFarmErrorState(error.toString()));
      rethrow;
    }
  }

  Future<List<FarmProductModel>> getProducts({String? uid}) async {
    emit(FarmGetFarmProductsLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('farms')
          .doc(uid)
          .collection('products')
          .get();
      if (querySnapshot.docs.isEmpty) {
        emit(FarmGetFarmProductsEmptyState([]));
        return <FarmProductModel>[];
      } else {
        List<FarmProductModel> products = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return FarmProductModel.fromJson(data);
        }).toList();

        emit(FarmGetFarmProductsSuccessState(products));
        return products;
      }
    } catch (error) {
      emit(FarmGetFarmProductsErrorState(error.toString()));
      rethrow;
    }
  }
}
