import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
part 'market_prices_states.dart';

class MarketPricesCubit extends Cubit<MarketPricesStates> {
  MarketPricesCubit() : super(MarketPricesInitialState());

  static MarketPricesCubit get(context) => BlocProvider.of(context);

  Future<List<ProductModel>> getAllProducts() async {
    emit(MarketPricesGetProductsLoadingState());
    List<ProductModel> allProducts = [];

    try {
      // Fetch all farm documents
      QuerySnapshot farmSnapshots =
          await FirebaseFirestore.instance.collection('farms').get();

      // For each farm, fetch the products from the subcollection
      for (var farmDoc in farmSnapshots.docs) {
        QuerySnapshot productSnapshots = await FirebaseFirestore.instance
            .collection('farms')
            .doc(farmDoc.id)
            .collection('products')
            .get();

        // Add each product to the list
        for (var productDoc in productSnapshots.docs) {
          ProductModel product =
              ProductModel.fromJson(productDoc.data() as Map<String, dynamic>);
          allProducts.add(product);
        }
      }
      emit(MarketPricesGetProductsSuccessState());
    } catch (e) {
      emit(MarketPricesGetProductsErrorState(e.toString()));
    }

    return allProducts;
  }
}
