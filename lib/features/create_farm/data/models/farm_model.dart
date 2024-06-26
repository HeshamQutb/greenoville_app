class FarmModel {
  final String uId;
  final String? farmImage;
  final String farmName;
  final String farmOwnerName;
  final String farmLocation;
  final bool hasProducts;

  FarmModel({
    required this.uId,
    this.farmImage,
    required this.farmName,
    required this.farmOwnerName,
    required this.farmLocation,
    required this.hasProducts,
  });

  factory FarmModel.fromJson(Map<String, dynamic>? json) {
    return FarmModel(
      uId: json?['uId'],
      farmImage: json?['farmImage'],
      farmName: json?['farmName'],
      farmOwnerName: json?['farmOwnerName'],
      farmLocation: json?['farmLocation'],
      hasProducts: json?['hasProducts'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'farmImage': farmImage,
      'farmName': farmName,
      'farmOwnerName': farmOwnerName,
      'farmLocation': farmLocation,
      'hasProducts': hasProducts,
    };
  }
}
