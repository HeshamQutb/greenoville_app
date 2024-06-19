class ToolModel {
  final String toolImage;
  final String toolName;
  final String? toolDescription;
  final String toolUsage;
  final String soilType;

  ToolModel({
    required this.toolImage,
    required this.toolName,
    this.toolDescription,
    required this.toolUsage,
    required this.soilType,
  });

  factory ToolModel.fromJson(Map<String, dynamic>? json) {
    return ToolModel(
      toolImage: json?['toolImage'],
      toolName: json?['toolName'],
      toolDescription: json?['toolDescription'],
      toolUsage: json?['toolUsage'],
      soilType: json?['soilType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'toolImage': toolImage,
      'toolName': toolName,
      'toolDescription': toolDescription,
      'toolUsage': toolUsage,
      'soilType': soilType,
    };
  }
}
