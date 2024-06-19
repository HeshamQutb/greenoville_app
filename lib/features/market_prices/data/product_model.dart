
class ProductModel {
  late final String productImage;
  final String productName;
  final String? productDescription;
  final String productId;
  final double productPrice;
  final String productUnit;
  late final int productQuantity;

  ProductModel({
    required this.productImage,
    required this.productName,
    this.productDescription,
    required this.productId,
    required this.productPrice,
    required this.productUnit,
    required this.productQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    return ProductModel(
      productImage: json?['productImage'],
      productName: json?['productName'],
      productDescription: json?['productDescription'],
      productId: json?['productId'],
      productPrice: json?['productPrice'],
      productUnit: json?['productUnit'],
      productQuantity: json?['productQuantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productDescription': productDescription,
      'productId': productId,
      'productPrice': productPrice,
      'productUnit': productUnit,
      'productQuantity': productQuantity,
    };
  }
}





