class FertilizerModel {
  final String fertilizerImage;
  final String fertilizerName;
  final String? fertilizerDescription;
  final String fertilizerUsage;
  final String soilType;

  FertilizerModel({
    required this.fertilizerImage,
    required this.fertilizerName,
    this.fertilizerDescription,
    required this.fertilizerUsage,
    required this.soilType,
  });

  factory FertilizerModel.fromJson(Map<String, dynamic>? json) {
    return FertilizerModel(
      fertilizerImage: json?['fertilizerImage'],
      fertilizerName: json?['fertilizerName'],
      fertilizerDescription: json?['fertilizerDescription'],
      fertilizerUsage: json?['fertilizerUsage'],
      soilType: json?['soilType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fertilizerImage': fertilizerImage,
      'fertilizerName': fertilizerName,
      'fertilizerDescription': fertilizerDescription,
      'fertilizerUsage': fertilizerUsage,
      'soilType': soilType,
    };
  }
}
