import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../constants.dart';
import '../../../../../core/models/comment_model.dart';
import '../../../../../core/models/like_model.dart';
import '../../../data/models/community_comment_model.dart';
import '../../../data/models/community_like_model.dart';
import '../../../data/models/community_post_model.dart';
import 'community_states.dart';

class CommunityCubit extends Cubit<CommunityStates> {
  CommunityCubit() : super(CommunityInitState());

  static CommunityCubit get(context) => BlocProvider.of(context);

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  // Get Posts
  Future<List<CommunityPostModel>> getPosts({String? uid}) async {
    emit(CommunityGetPostLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('timestamp', descending: true)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        emit(CommunityGetPostSuccessState([]));
        return <CommunityPostModel>[];
      } else {
        List<CommunityPostModel> posts = [];
        for (var doc in querySnapshot.docs) {
          var data = doc.data() as Map<String, dynamic>;
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(data['uId'])
              .get();
          if (userDoc.data() != null) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var post = CommunityPostModel.fromJson({
              ...data,
              'isVerified': userData['isVerified'],
              'bio': userData['bio'],
              'coverImage': userData['coverImage'],
              'userRole': userData['userRole'],
              'userName': userData['userName'],
              'userImage': userData['userImage'],
            });

            // Filter posts based on uid (if provided)
            if (uid == null || data['uId'] == uid) {
              posts.add(post);
            }
          }
        }
        emit(CommunityGetPostSuccessState(posts));
        return posts;
      }
    } catch (error) {
      emit(CommunityGetPostErrorState(error.toString()));
      rethrow;
    }
  }

  // Like Post
  Future<void> likePost({
    required String postId,
  }) async {
    try {
      DocumentReference likeRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(uId);

      // Check if the user has already liked the post
      DocumentSnapshot likeSnapshot = await likeRef.get();

      if (likeSnapshot.exists) {
        // User has already liked the post, so remove the like
        await likeRef.delete();
        emit(CommunityUnlikePostSuccessState());
      } else {
        // User hasn't liked the post yet, so add the like
        LikeModel like = LikeModel(
          uId: uId!,
          timestamp: Timestamp.now(),
        );
        await likeRef.set(like.toMap());
        emit(CommunityLikePostSuccessState());
      }
    } catch (error) {
      emit(CommunityLikePostErrorState(error.toString()));
    }
  }

  // Get Likes for a Post
  Stream<List<CommunityLikeModel>> getLikes({required String postId}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        // Return an empty list if there are no documents in the collection
        return <CommunityLikeModel>[];
      } else {
        List<CommunityLikeModel> likes = [];
        for (var doc in snapshot.docs) {
          var data = doc.data();
          final uId = data['uId'];
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get();
          if (userDoc.exists) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var like = CommunityLikeModel.fromJson({
              ...data,
              'isVerified': userData['isVerified'],
              'userName': userData['userName'],
              'userRole': userData['userRole'],
              'userImage': userData['userImage'],
            });
            likes.add(like);
          }
        }
        return likes;
      }
    }).handleError((error) {
      emit(CommunityGetPostLikesErrorState(error.toString()));
    });
  }

  // Comment on Post
  Future<void> commentOnPost({
    required String postId,
    required String content,
  }) async {
    try {
      DocumentReference commentRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc();

      CommentModel comment = CommentModel(
        uId: uId!,
        commentId: commentRef.id,
        timestamp: Timestamp.now(),
        content: content,
      );
      await commentRef.set(comment.toMap());
      emit(CommunityCommentPostSuccessState());
    } catch (error) {
      emit(CommunityCommentPostErrorState(error.toString()));
    }
  }

  // Get Comments for a Post
  Stream<List<CommunityCommentModel>> getComments({required String postId}) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        return <CommunityCommentModel>[];
      } else {
        List<CommunityCommentModel> comments = [];
        for (var doc in snapshot.docs) {
          var data = doc.data();
          final uId = data['uId'];
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get();
          if (userDoc.exists) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var comment = CommunityCommentModel.fromJson({
              ...data,
              'isVerified': userData['isVerified'],
              'userName': userData['userName'],
              'userImage': userData['userImage'],
            });
            comments.add(comment);
          }
        }
        return comments;
      }
    }).handleError((error) {
      emit(CommunityGetPostCommentErrorState(error.toString()));
    });
  }

  // Like Comment
  Future<void> likeComment({
    required String postId,
    required String commentId,
  }) async {
    try {
      DocumentReference likeRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('commentLikes')
          .doc(uId);

      // Check if the user has already liked the post
      DocumentSnapshot likeSnapshot = await likeRef.get();

      if (likeSnapshot.exists) {
        // User has already liked the post, so remove the like
        await likeRef.delete();
        emit(CommunityUnlikeCommentSuccessState());
      } else {
        // User hasn't liked the post yet, so add the like
        LikeModel like = LikeModel(
          uId: uId!,
          timestamp: Timestamp.now(),
        );
        await likeRef.set(like.toMap());
        emit(CommunityLikeCommentSuccessState());
      }
    } catch (error) {
      emit(CommunityLikeCommentErrorState(error.toString()));
    }
  }

  // Get Likes for a Comment
  Stream<List<CommunityLikeModel>> getCommentLikes({
    required String postId,
    required String commentId,
  }) {
    try {
      return FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('commentLikes')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return CommunityLikeModel.fromJson(doc.data());
        }).toList();
      }).handleError((error) {
        emit(CommunityGetCommentLikesErrorState(error.toString()));
      });
    } catch (error) {
      emit(CommunityGetCommentLikesErrorState(error.toString()));
      rethrow;
    }
  }

  // Replay to Comment
  Future<void> replayToComment({
    required String postId,
    required String commentId,
    required String content,
  }) async {
    try {
      DocumentReference replayRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('replies')
          .doc();

      CommentModel replay = CommentModel(
        uId: uId!,
        commentId: replayRef.id,
        timestamp: Timestamp.now(),
        content: content,
      );
      await replayRef.set(replay.toMap());
      emit(CommunityReplayToCommentSuccessState());
    } catch (error) {
      emit(CommunityReplayToCommentErrorState(error.toString()));
    }
  }

  // Get Replies for a comments
  Stream<List<CommunityCommentModel>> getReplies({
    required String postId,
    required String commentId,
  }) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .collection('replies')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      if (snapshot.docs.isEmpty) {
        return <CommunityCommentModel>[];
      } else {
        List<CommunityCommentModel> replies = [];
        for (var doc in snapshot.docs) {
          var data = doc.data();
          final uId = data['uId'];
          var userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uId)
              .get();
          if (userDoc.exists) {
            var userData = userDoc.data() as Map<String, dynamic>;
            var replay = CommunityCommentModel.fromJson({
              ...data,
              'isVerified': userData['isVerified'],
              'userName': userData['userName'],
              'userImage': userData['userImage'],
            });
            replies.add(replay);
          }
        }
        return replies;
      }
    }).handleError((error) {
      emit(CommunityGetReplayErrorState(error.toString()));
    });
  }

  // Like Replay
  Future<void> likeReplay({
    required String postId,
    required String commentId,
    required String replayId,
  }) async {
    try {
      DocumentReference likeRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('replies')
          .doc(replayId)
          .collection('replayLikes')
          .doc(uId);

      // Check if the user has already liked the post
      DocumentSnapshot likeSnapshot = await likeRef.get();

      if (likeSnapshot.exists) {
        // User has already liked the post, so remove the like
        await likeRef.delete();
        emit(CommunityUnlikeReplaySuccessState());
      } else {
        // User hasn't liked the post yet, so add the like
        LikeModel like = LikeModel(
          uId: uId!,
          timestamp: Timestamp.now(),
        );
        await likeRef.set(like.toMap());
        emit(CommunityLikeReplaySuccessState());
      }
    } catch (error) {
      emit(CommunityLikeReplayErrorState(error.toString()));
    }
  }

  // Get Likes for a Replies
  Stream<List<CommunityLikeModel>> getRepliesLikes({
    required String postId,
    required String commentId,
    required String replayId,
  }) {
    try {
      return FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .collection('replies')
          .doc(replayId)
          .collection('replayLikes')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return CommunityLikeModel.fromJson(doc.data());
        }).toList();
      }).handleError((error) {
        emit(CommunityGetReplayLikesErrorState(error.toString()));
      });
    } catch (error) {
      emit(CommunityGetReplayLikesErrorState(error.toString()));
      rethrow;
    }
  }

  // Get Total Comments and Replies counts
  Stream<int> getTotalCommentsAndReplies({required String postId}) {
    final commentsStream = FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .snapshots();

    return commentsStream.asyncMap((commentsSnapshot) async {
      int totalReplies = 0;

      for (var commentDoc in commentsSnapshot.docs) {
        final repliesSnapshot = await FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentDoc.id)
            .collection('replies')
            .get();
        totalReplies += repliesSnapshot.docs.length;
      }

      return commentsSnapshot.docs.length + totalReplies;
    });
  }
}
