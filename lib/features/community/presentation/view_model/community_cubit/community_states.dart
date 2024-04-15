
abstract class CommunityStates {}

class CommunityInitialState extends CommunityStates {}

class CommunityGetPostLoadingState extends CommunityStates {}

class CommunityGetPostSuccessState extends CommunityStates {}

class CommunityGetPostErrorState extends CommunityStates {
  final String error;

  CommunityGetPostErrorState(this.error);
}

// Likes
class CommunityLikeSuccessState extends CommunityStates {}

class CommunityLikeErrorState extends CommunityStates {
  final String error;
  CommunityLikeErrorState(this.error);
}

// Comments
class CommunityCommentSuccessState extends CommunityStates {}

class CommunityCommentErrorState extends CommunityStates {
  final String error;
  CommunityCommentErrorState(this.error);
}
