
import '../../../../auth/data/models/user_model.dart';

abstract class EditProfileStates {}

class EditProfileInitState extends EditProfileStates {}

class EditProfileUserImagePickedState extends EditProfileStates {}

class EditProfileCoverImagePickedState extends EditProfileStates {}

class EditProfileLoadingState extends EditProfileStates {}

class EditProfileSuccessState extends EditProfileStates {
  final UserModel updatedUser;

  EditProfileSuccessState(this.updatedUser);
}

class EditProfileErrorState extends EditProfileStates {
  final String error;
  EditProfileErrorState(this.error);
}

