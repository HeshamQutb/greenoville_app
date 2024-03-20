import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/verification_view_cubit/states.dart';

import '../../../../../constants.dart';
import '../../../../../core/network/local/cache_helper.dart';


class VerificationCubit extends Cubit<VerificationStates> {
  VerificationCubit() : super(VerificationInitialState());

  static VerificationCubit get(context) => BlocProvider.of(context);

  void checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
      CacheHelper.setData(
        key: 'uId',
        value: FirebaseAuth.instance.currentUser?.uid,
      ).then((value) {
        uId = CacheHelper.getData(key: 'uId');
        emit(CheckEmailVerificationSuccessState());
      }).catchError((error) {
        emit(CheckEmailVerificationErrorState(error));
      });
    }
  }

  void reSendEmailVerification() {
    FirebaseAuth.instance.currentUser?.sendEmailVerification().then((value) {
      emit(ResendEmailVerificationSuccessState());
    }).catchError((error) {
      emit(ResendEmailVerificationErrorState(error));
    });
  }
}
