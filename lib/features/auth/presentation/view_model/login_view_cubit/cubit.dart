import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/login_view_cubit/states.dart';

import '../../../../../generated/l10n.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
}){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error)
    {
      String errorMessage = S.of(context).defaultSignInFailed;
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-email':
          case 'wrong-password':
            errorMessage = S.of(context).wrongPasswordEmail;
            break;
          case 'user-not-found':
            errorMessage = S.of(context).userNotFound;
            break;
          case 'user-disabled':
            errorMessage = S.of(context).userDisabled;
            break;
          default:
            errorMessage = S.of(context).defaultSignInFailed;
        }
      }
      emit(LoginErrorState(errorMessage));
    });

  }



  bool isPassword = true;
  IconData suffix = Icons.visibility;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    isPassword == true ? suffix = Icons.visibility : suffix = Icons.visibility_off;
    emit(LoginChangePasswordVisibilityState());
  }


}