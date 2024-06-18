abstract class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

// Add Product
class AddProductLoadingState extends AddProductStates {}

class AddProductSuccessState extends AddProductStates {}

class AddProductErrorState extends AddProductStates {
  final String error;
  AddProductErrorState(this.error);
}

// Product Quantity
class ProductQuantityChangeState extends AddProductStates {}

// Product Image
class GetProductImageSuccessState extends AddProductStates {}

class GetProductImageCancelledState extends AddProductStates {}

class GetProductImageErrorState extends AddProductStates {}

class RemoveProductImageSuccessState extends AddProductStates {}

