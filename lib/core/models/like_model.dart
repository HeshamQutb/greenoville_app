import 'package:cloud_firestore/cloud_firestore.dart';


class LikeModel {
  final String uId;
  final Timestamp timestamp;

  LikeModel({
    required this.uId,
    required this.timestamp,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      uId: json['uId'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'timestamp': timestamp,
    };
  }
}