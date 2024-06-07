
class ProductModel {
  final String? productImage;
  final String productName;
  final String productDescription;
  final String productId;
  final double productPrice;
  final int productAmount;

  ProductModel({
    this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productId,
    required this.productPrice,
    required this.productAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic>? json) {
    return ProductModel(
      productImage: json?['productImage'],
      productName: json?['productName'],
      productDescription: json?['productDescription'],
      productId: json?['productId'],
      productPrice: json?['productPrice'],
      productAmount: json?['productAmount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productDescription': productDescription,
      'productId': productId,
      'productPrice': productPrice,
      'productAmount': productAmount,
    };
  }
}





