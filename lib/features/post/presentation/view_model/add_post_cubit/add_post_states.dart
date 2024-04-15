abstract class AddPostStates {}

class AddPostInitialState extends AddPostStates {}

// Add Post
class AddPostLoadingState extends AddPostStates {}

class AddPostSuccessState extends AddPostStates {}

class AddPostErrorState extends AddPostStates {
  final String error;
  AddPostErrorState(this.error);
}

// Post Image
class GetPostImageSuccessState extends AddPostStates {}

class GetPostImageErrorState extends AddPostStates {}

class RemovePostImageSuccessState extends AddPostStates {}
