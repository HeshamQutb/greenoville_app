

abstract class VerificationStates {}


class VerificationInitialState extends VerificationStates{}

class CheckEmailVerificationSuccessState extends VerificationStates{}
class CheckEmailVerificationErrorState extends VerificationStates{
  final String error;

  CheckEmailVerificationErrorState(this.error);
}

class ResendEmailVerificationSuccessState extends VerificationStates{}
class ResendEmailVerificationErrorState extends VerificationStates{
  final String error;

  ResendEmailVerificationErrorState(this.error);
}
