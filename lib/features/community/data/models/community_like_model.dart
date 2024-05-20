import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityLikeModel {
  final bool? isVerified;
  final String? userName;
  final String? userRole;
  final String? userImage;
  final String uId;
  final Timestamp timestamp;

  CommunityLikeModel({
    this.isVerified,
    this.userName,
    this.userRole,
    this.userImage,
    required this.uId,
    required this.timestamp,
  });

  factory CommunityLikeModel.fromJson(Map<String, dynamic> json) {
    return CommunityLikeModel(
      isVerified: json['isVerified'],
      userName: json['userName'],
      userRole: json['userRole'],
      userImage: json['userImage'],
      uId: json['uId'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isVerified': isVerified,
      'userName': userName,
      'userRole': userRole,
      'userImage': userImage,
      'uId': uId,
      'timestamp': timestamp,
    };
  }
}
