import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityCommentModel {
  final String userName;
  final String userImage;
  final String uId;
  final Timestamp timestamp;
  final String content;

  CommunityCommentModel({
    required this.userName,
    required this.userImage,
    required this.uId,
    required this.timestamp,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userImage': userImage,
      'uId': uId,
      'timestamp': timestamp,
      'content': content,
    };
  }

  factory CommunityCommentModel.fromJson(Map<String, dynamic> json) {
    return CommunityCommentModel(
      userName: json['userName'],
      userImage: json['userImage'],
      uId: json['uId'],
      timestamp: json['timestamp'],
      content: json['content'],
    );
  }
}
