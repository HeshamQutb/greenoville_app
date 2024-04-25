
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String uId;
  final String? postImage;
  final Timestamp timestamp;
  final String? description;
  final String postId;

  PostModel({
    required this.uId,
    this.postImage,
    required this.timestamp,
    this.description,
    required this.postId,
  });

  factory PostModel.fromJson(Map<String, dynamic>? json) {
    return PostModel(
      uId: json?['uId'],
      postImage: json?['postImage'],
      timestamp: json?['timestamp'],
      description: json?['text'],
      postId: json?['postId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'postImage': postImage,
      'timestamp': timestamp,
      'text': description,
      'postId': postId,
    };
  }
}





