import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityLikeModel {
  final String userName;
  final String userImage;
  final String uId;
  final Timestamp timestamp;

  CommunityLikeModel({
    required this.userName,
    required this.userImage,
    required this.uId,
    required this.timestamp,
  });

  factory CommunityLikeModel.fromJson(Map<String, dynamic> json) {
    return CommunityLikeModel(
      userName: json['userName'],
      userImage: json['userImage'],
      uId: json['uId'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userImage': userImage,
      'uId': uId,
      'timestamp': timestamp,
    };
  }
}
