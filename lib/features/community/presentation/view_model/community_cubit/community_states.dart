import '../../../data/models/community_post_model.dart';

abstract class CommunityStates {}

class CommunityInitState extends CommunityStates {}

// Get Post states
class CommunityGetPostLoadingState extends CommunityStates {}

class CommunityGetPostSuccessState extends CommunityStates {
  List<CommunityPostModel> posts;
  CommunityGetPostSuccessState(this.posts);
}

class CommunityGetPostErrorState extends CommunityStates {
  final String error;

  CommunityGetPostErrorState(this.error);
}

// Like Post states
class CommunityUnlikePostSuccessState extends CommunityStates {}

class CommunityLikePostSuccessState extends CommunityStates {}

class CommunityLikePostErrorState extends CommunityStates {
  final String error;

  CommunityLikePostErrorState(this.error);
}

// Get Likes states
class CommunityGetPostLikesSuccessState extends CommunityStates {}

class CommunityGetPostLikesErrorState extends CommunityStates {
  final String error;

  CommunityGetPostLikesErrorState(this.error);
}

// Comment states
class CommunityCommentPostSuccessState extends CommunityStates {}

class CommunityCommentPostErrorState extends CommunityStates {
  final String error;

  CommunityCommentPostErrorState(this.error);
}

// Get Comments states
class CommunityGetPostCommentSuccessState extends CommunityStates {
  List<CommunityPostModel> comments;
  CommunityGetPostCommentSuccessState(this.comments);
}

class CommunityGetPostCommentErrorState extends CommunityStates {
  final String error;

  CommunityGetPostCommentErrorState(this.error);
}

// Like Comment states
class CommunityUnlikeCommentSuccessState extends CommunityStates {}

class CommunityLikeCommentSuccessState extends CommunityStates {}

class CommunityLikeCommentErrorState extends CommunityStates {
  final String error;

  CommunityLikeCommentErrorState(this.error);
}

// Get Comment Likes State
class CommunityGetCommentLikesSuccessState extends CommunityStates {}

class CommunityGetCommentLikesErrorState extends CommunityStates {
  final String error;

  CommunityGetCommentLikesErrorState(this.error);
}

// Replay states
class CommunityReplayToCommentSuccessState extends CommunityStates {}

class CommunityReplayToCommentErrorState extends CommunityStates {
  final String error;

  CommunityReplayToCommentErrorState(this.error);
}

// Get Replies states
class CommunityGetReplaySuccessState extends CommunityStates {
  List<CommunityPostModel> comments;
  CommunityGetReplaySuccessState(this.comments);
}

class CommunityGetReplayErrorState extends CommunityStates {
  final String error;

  CommunityGetReplayErrorState(this.error);
}

// Like Replay states
class CommunityUnlikeReplaySuccessState extends CommunityStates {}

class CommunityLikeReplaySuccessState extends CommunityStates {}

class CommunityLikeReplayErrorState extends CommunityStates {
  final String error;

  CommunityLikeReplayErrorState(this.error);
}

// Get Replay Likes states
class CommunityGetReplayLikesSuccessState extends CommunityStates {}

class CommunityGetReplayLikesErrorState extends CommunityStates {
  final String error;

  CommunityGetReplayLikesErrorState(this.error);
}


// Delete post
class DeletePostSuccessState extends CommunityStates {}

class DeletePostErrorState extends CommunityStates {
  final String error;

  DeletePostErrorState(this.error);
}