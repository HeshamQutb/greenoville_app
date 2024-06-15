import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderId;
  final DateTime createdAt;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(
      message: jsonData['message'],
      senderId: jsonData['senderId'],
      createdAt: (jsonData['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'createdAt': createdAt,
    };
  }
}
