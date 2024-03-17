

abstract class SignUpStates {}


class SignUpInitialState extends SignUpStates{}
class SignUpChangePasswordVisibilityState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{}
class SignUpErrorState extends SignUpStates{
  final String error;

  SignUpErrorState(this.error);
}


class SendEmailVerificationSuccessState extends SignUpStates{}
class SendEmailVerificationErrorState extends SignUpStates{
  final String error;

  SendEmailVerificationErrorState(this.error);
}



class CreateUserSuccessState extends SignUpStates{}
class CreateUserErrorState extends SignUpStates{
  final String error;

  CreateUserErrorState(this.error);
}



class GetUserImageSuccessState extends SignUpStates{}
class GetUserImageErrorState extends SignUpStates{}


class UploadUserImageSuccessState extends SignUpStates{}
class UploadUserImageErrorState extends SignUpStates{}