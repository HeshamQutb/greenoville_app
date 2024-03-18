import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/verification_view_text_section.dart';

import '../../../../../core/services/toast_services.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../root/presentation/views/root_view.dart';
import '../../view_model/verification_view_cubit/cubit.dart';
import '../../view_model/verification_view_cubit/states.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationStates>(
      listener: (context, state) {
        if (state is CheckEmailVerificationSuccessState) {
          showToast(
            message: 'Verified successfully',
            state: ToastState.success,
          );
          navigateAndFinish(context, const RootView());
        }
        if (state is CheckEmailVerificationErrorState) {
          showToast(
            message: 'Please Confirm Verification',
            state: ToastState.error,
          );
        }
        if (state is ResendEmailVerificationSuccessState) {
          showToast(
            message: 'Check your mail',
            state: ToastState.error,
          );
        }
      },
      builder: (context, state) {
        var verificationCubit = VerificationCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerificationViewTextSection(),
            const SizedBox(
              height: 10,
            ),
            DefaultButton(
              function: () {
                verificationCubit.checkEmailVerification();
              },
              text: 'continue',
              isUpperCase: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'If you can\'t find it',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                DefaultTextButton(
                  onPressed: () {
                    verificationCubit.reSendEmailVerification();
                    // FirebaseAuth.instance.currentUser
                    //     ?.sendEmailVerification()
                    //     .then((value) {
                    //   showToast(
                    //       message: 'Check your mail', state: ToastState.success);
                    // }).catchError((error) {
                    //   print(error.toString());
                    // });
                  },
                  text: 'click here to resend',
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
