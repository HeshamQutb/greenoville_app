import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenoville_app/features/community/data/models/community_comment_model.dart';
import 'community_like_model.dart';

class CommunityPostModel {
  final bool isVerified;
  final String userName;
  final String uId;
  final String userImage;
  final String? postImage;
  final Timestamp timestamp;
  final String? description;
  final String postId;
  final List<CommunityLikeModel> likes;
  final List<CommunityCommentModel> comments;

  CommunityPostModel({
    required this.isVerified,
    required this.userName,
    required this.uId,
    required this.userImage,
    this.postImage,
    required this.timestamp,
    this.description,
    required this.postId,
    required this.likes,
    required this.comments,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic>? json) {
    return CommunityPostModel(
      isVerified: json?['isVerified'],
      userName: json?['userName'],
      uId: json?['uId'],
      userImage: json?['userImage'],
      postImage: json?['postImage'],
      timestamp: json?['timestamp'],
      description: json?['text'],
      postId: json?['postId'],
      likes: (json?['likes'] as List<dynamic>?)
              ?.map((likeJson) =>
                  CommunityLikeModel.fromJson(likeJson as Map<String, dynamic>))
              .toList() ??
          [],
      comments: (json?['comments'] as List<dynamic>?)
              ?.map((commentJson) => CommunityCommentModel.fromJson(
                  commentJson as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isVerified': isVerified,
      'userName': userName,
      'uId': uId,
      'userImage': userImage,
      'postImage': postImage,
      'timestamp': timestamp,
      'text': description,
      'postId': postId,
      'likes': likes.map((like) => like.toMap()).toList(),
      'comments': comments.map((comment) => comment.toMap()).toList()
    };
  }
}
