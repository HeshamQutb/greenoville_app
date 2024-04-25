import '../../features/community/data/models/community_post_model.dart';

abstract class AppStates {}

class AppInitState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeNavBarState extends AppStates {}

class AppSignOutState extends AppStates {}

class SelectLanguageState extends AppStates {
  final String language;

  SelectLanguageState(this.language);
}

// Get User Data States
class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppGetUserNullState extends AppStates {
  final String error;

  AppGetUserNullState(this.error);
}

// Add Post
class AddPostLoadingState extends AppStates {}

class AddPostSuccessState extends AppStates {}

class AddPostErrorState extends AppStates {
  final String error;
  AddPostErrorState(this.error);
}

// Post Image
class GetPostImageSuccessState extends AppStates {}

class GetPostImageErrorState extends AppStates {}

class RemovePostImageSuccessState extends AppStates {}

// Community States
class CommunityGetPostLoadingState extends AppStates {}

class CommunityGetPostSuccessState extends AppStates {
  List<CommunityPostModel> posts;
  CommunityGetPostSuccessState(this.posts);
}

class CommunityGetPostErrorState extends AppStates {
  final String error;

  CommunityGetPostErrorState(this.error);
}

// Like states
class CommunityUnlikePostSuccessState extends AppStates {}

class CommunityLikePostSuccessState extends AppStates {}

class CommunityLikePostErrorState extends AppStates {
  final String error;

  CommunityLikePostErrorState(this.error);
}

// Get Likes states
class CommunityGetPostLikesSuccessState extends AppStates {

}

class CommunityGetPostLikesErrorState extends AppStates {
  final String error;

  CommunityGetPostLikesErrorState(this.error);
}

// Comment states

class CommunityCommentPostSuccessState extends AppStates {}

class CommunityCommentPostErrorState extends AppStates {
  final String error;

  CommunityCommentPostErrorState(this.error);
}

// Get Comments states
class CommunityGetPostCommentSuccessState extends AppStates {
  List<CommunityPostModel> comments;
  CommunityGetPostCommentSuccessState(this.comments);
}

class CommunityGetPostCommentErrorState extends AppStates {
  final String error;

  CommunityGetPostCommentErrorState(this.error);
}