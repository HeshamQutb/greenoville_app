
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_item_states.dart';

class ProductItemCubit extends Cubit<ProductItemStates> {
  ProductItemCubit() : super(ProductItemInitialState());

  static ProductItemCubit get(context) => BlocProvider.of(context);


}
