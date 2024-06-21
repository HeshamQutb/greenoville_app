
class TipsModel {
  final String uId;

  final String description;
  final String tipsId;

  TipsModel({
    required this.uId,
    required this.description,
    required this.tipsId,
  });

  factory TipsModel.fromJson(Map<String, dynamic>? json) {
    return TipsModel(
      uId: json?['uId'],
      description: json?['description'],
      tipsId: json?['tipsId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'description': description,
      'tipsId': tipsId,
    };
  }
}
