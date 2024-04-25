import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String uId;
  final Timestamp timestamp;
  final String content;

  CommentModel({
    required this.uId,
    required this.timestamp,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'timestamp': timestamp,
      'content': content,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      uId: json['uId'],
      timestamp: json['timestamp'],
      content: json['content'],
    );
  }
}
