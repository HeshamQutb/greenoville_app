abstract class EditPostStates {}

class EditPostInitialState extends EditPostStates {}

// Edit Post
class EditPostLoadingState extends EditPostStates {}

class EditPostSuccessState extends EditPostStates {}

class EditPostErrorState extends EditPostStates {
  final String error;
  EditPostErrorState(this.error);
}

// Post Image
class GetPostImageSuccessState extends EditPostStates {}

class GetPostImageCancelledState extends EditPostStates {}

class GetPostImageErrorState extends EditPostStates {}

class RemovePostImageSuccessState extends EditPostStates {}


class DeletePostImageSuccessState extends EditPostStates {}

class DeletePostImageErrorState extends EditPostStates {
  final String error;
  DeletePostImageErrorState(this.error);
}