import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../data/models/community_post_model.dart';
import 'community_states.dart';

class CommunityCubit extends Cubit<CommunityStates> {
  CommunityCubit() : super(CommunityInitialState());

  static CommunityCubit get(context) => BlocProvider.of(context);

  List<CommunityPostModel> posts = [];

  Future<void> getPost() async {
    posts = [];
    emit(CommunityGetPostLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .orderBy('clockTime')
          .get();
      for (var doc in querySnapshot.docs) {
        posts.add(CommunityPostModel.fromJson(doc.data() as Map<String, dynamic>?));
      }
      emit(CommunityGetPostSuccessState());
    } catch (error) {
      emit(CommunityGetPostErrorState(error.toString()));
    }
  }

  Future<void> postLike({
    required String postId,
    required String uId,
    required dynamic likes,
  }) async {
    try {
      if (likes.contains(uId)) {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .update({
          'likes': FieldValue.arrayRemove([uId]),
        });
      } else {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .update({
          'likes': FieldValue.arrayUnion([uId]),
        });
      }
      emit(CommunityLikeSuccessState());
    } catch (error) {
      print(error.toString());
      emit(CommunityLikeErrorState(error.toString()));
    }
  }

  Future<void> postReaction(
      {required BuildContext context,
      required String postId,
      required String collectionName,
      required Map<String, dynamic> data}) async {
    final userModel = AppCubit.get(context).userModel;
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection(collectionName)
          .doc(userModel?.uId)
          .set(data);
      emit(CommunityLikeSuccessState());
    } catch (error) {
      emit(CommunityLikeErrorState(error.toString()));
    }
  }

  Future<void> postComment(
      {required BuildContext context, required String postId}) async {
    await postReaction(
        context: context,
        postId: postId,
        collectionName: 'comments',
        data: {'comment': true});
  }
}
