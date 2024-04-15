import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/post/presentation/view_model/post_cubit/post_states.dart';
import '../../../../../core/app_cubit/app_cubit.dart';

class PostCubit extends Cubit<PostStates> {
  PostCubit() : super(PostInitialState());

  static PostCubit get(context) => BlocProvider.of(context);



  Future<void> postLike({required BuildContext context,required String postId}) async {
    final userModel = AppCubit.get(context).userModel;
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel?.uId)
        .set({'like': true}).then((value) {
      emit(PostLikeSuccessState());
    }).catchError((error) {
      emit(PostLikeErrorState(error.toString()));
    });
  }

  Future<void> postComment({required BuildContext context,required String postId}) async {
    final userModel = AppCubit.get(context).userModel;
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(userModel?.uId)
        .set({'comment': true}).then((value) {
      emit(PostCommentSuccessState());
    }).catchError((error) {
      emit(PostCommentErrorState(error.toString()));
    });
  }
}
