abstract class PostStates {}

class PostInitialState extends PostStates {}

class PostLikeSuccessState extends PostStates {}

class PostLikeErrorState extends PostStates {
  final String error;
  PostLikeErrorState(this.error);
}

class PostCommentSuccessState extends PostStates {}

class PostCommentErrorState extends PostStates {
  final String error;
  PostCommentErrorState(this.error);
}
