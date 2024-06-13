
class FarmProductModel {
  final String? productImage;
  final String productName;
  final String? productDescription;
  final String productId;
  final double productPrice;
  final String productUnit;
  final int productQuantity;

  FarmProductModel({
    this.productImage,
    required this.productName,
    this.productDescription,
    required this.productId,
    required this.productPrice,
    required this.productUnit,
    required this.productQuantity,
  });

  factory FarmProductModel.fromJson(Map<String, dynamic>? json) {
    return FarmProductModel(
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





