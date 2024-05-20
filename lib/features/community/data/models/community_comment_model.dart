import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityCommentModel {
  final bool isVerified;
  final String userName;
  final String userImage;
  final String uId;
  final String commentId;
  final Timestamp timestamp;
  final String content;

  CommunityCommentModel({
    required this.isVerified,
    required this.userName,
    required this.userImage,
    required this.uId,
    required this.commentId,
    required this.timestamp,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'isVerified': isVerified,
      'userName': userName,
      'userImage': userImage,
      'uId': uId,
      'commentId': commentId,
      'timestamp': timestamp,
      'content': content,
    };
  }

  factory CommunityCommentModel.fromJson(Map<String, dynamic> json) {
    return CommunityCommentModel(
      isVerified: json['isVerified'],
      userName: json['userName'],
      userImage: json['userImage'],
      uId: json['uId'],
      commentId: json['commentId'],
      timestamp: json['timestamp'],
      content: json['content'],
    );
  }
}
