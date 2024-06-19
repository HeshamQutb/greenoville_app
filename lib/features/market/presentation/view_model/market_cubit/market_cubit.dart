import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/market/data/market_farm_model.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import 'market_states.dart';

class MarketCubit extends Cubit<MarketStates> {
  MarketCubit() : super(MarketInitState());

  static MarketCubit get(context) => BlocProvider.of(context);

  // Get Farms
  Future<List<MarketFarmModel>> getFarms({String? uid}) async {
    emit(MarketGetFarmLoadingState());
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('farms').get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(MarketGetFarmSuccessState([]));
        return <MarketFarmModel>[];
      } else {
        List<MarketFarmModel> farms = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(data['uId'])
              .get();
          if (userDoc.data() != null) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var farm = MarketFarmModel.fromJson({
              ...data,
              'userName': userData['userName'],
              'userImage': userData['userImage'],
              'coverImage': userData['coverImage'],
              'userRole': userData['userRole'],
              'bio': userData['bio'],
              'isVerified': userData['isVerified'],
            });

            // Filter farms based on uid (if provided)
            if (uid == null || data['uId'] == uid) {
              farms.add(farm);
            }
          }
        }
        emit(MarketGetFarmSuccessState(farms));
        return farms;
      }
    } catch (error) {
      emit(MarketGetFarmErrorState(error.toString()));
      rethrow;
    }
  }

  // Get Products
  Future<List<ProductModel>> getProducts({String? uid}) async {
    emit(MarketGetFarmProductsLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('farms')
          .doc(uid)
          .collection('products')
          .get();
      if (querySnapshot.docs.isEmpty) {
        emit(MarketGetFarmProductsEmptyState([]));
        return <ProductModel>[];
      } else {
        List<ProductModel> products = querySnapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return ProductModel.fromJson(data);
        }).toList();

        emit(MarketGetFarmProductsSuccessState(products));
        return products;
      }
    } catch (error) {
      emit(MarketGetFarmProductsErrorState(error.toString()));
      rethrow;
    }
  }
}
