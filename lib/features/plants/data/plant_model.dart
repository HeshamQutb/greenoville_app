class PlantModel {
  final String plantImage;
  final String plantName;
  final String? plantDescription;
  final String plantUsage;
  final String soilType;

  PlantModel({
    required this.plantImage,
    required this.plantName,
    this.plantDescription,
    required this.plantUsage,
    required this.soilType,
  });

  factory PlantModel.fromJson(Map<String, dynamic>? json) {
    return PlantModel(
      plantImage: json?['plantImage'],
      plantName: json?['plantName'],
      plantDescription: json?['plantDescription'],
      plantUsage: json?['plantUsage'],
      soilType: json?['soilType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'plantImage': plantImage,
      'plantName': plantName,
      'plantDescription': plantDescription,
      'plantUsage': plantUsage,
      'soilType': soilType,
    };
  }
}
