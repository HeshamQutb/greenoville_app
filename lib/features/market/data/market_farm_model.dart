
import 'package:greenoville_app/features/market/data/product_model.dart';

class MarketFarmModel {
  final String userName;
  final String userImage;
  final String coverImage;
  final String userRole;
  final String bio;
  final bool isVerified;
  final String uId;
  final String farmImage;
  final String farmName;
  final String farmOwnerName;
  final String farmLocation;
  final List<ProductModel> products;

  MarketFarmModel({
    required this.userName,
    required this.userImage,
    required this.coverImage,
    required this.userRole,
    required this.bio,
    required this.isVerified,
    required this.uId,
    required this.farmImage,
    required this.farmName,
    required this.farmOwnerName,
    required this.farmLocation,
    required this.products,
  });

  factory MarketFarmModel.fromJson(Map<String, dynamic>? json) {
    return MarketFarmModel(
      userName: json?['userName'],
      userImage: json?['userImage'],
      coverImage: json?['coverImage'],
      userRole: json?['userRole'],
      bio: json?['bio'],
      isVerified: json?['isVerified'],
      uId: json?['uId'],
      farmImage: json?['farmImage'],
      farmName: json?['farmName'],
      farmOwnerName: json?['farmOwnerName'],
      farmLocation: json?['farmLocation'],
      products: (json?['products'] as List<dynamic>?)
              ?.map((productJson) =>
                  ProductModel.fromJson(productJson as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userImage': userImage,
      'coverImage': coverImage,
      'userRole': userRole,
      'bio': bio,
      'isVerified': isVerified,
      'uId': uId,
      'farmImage': farmImage,
      'farmName': farmName,
      'farmOwnerName': farmOwnerName,
      'farmLocation': farmLocation,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }
}
