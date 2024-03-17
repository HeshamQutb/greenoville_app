import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/services/navigate_services.dart';
import '../../../../core/services/toast_services.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_text_button.dart';
import '../view_model/signup_view_cubit/cubit.dart';
import '../view_model/signup_view_cubit/states.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'We have sent a verification email to:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${FirebaseAuth.instance.currentUser?.email}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'click the link in your email to verify your account',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultButton(
                      function: () async {
                        await FirebaseAuth.instance.currentUser?.reload();
                        if (FirebaseAuth.instance.currentUser!.emailVerified ==
                            true) {
                          CacheHelper.setData(
                            key: 'uId',
                            value: FirebaseAuth.instance.currentUser?.uid,
                          ).then((value) {
                            navigateAndFinish(context, const RootView());
                          });
                          showToast(
                              message: 'Verified successfully',
                              state: ToastState.success);
                          setState(() {
                            uId = CacheHelper.getData(key: 'uId');
                          });
                        }
                      },
                      text: 'continue',
                      isUpperCase: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'If you can\'t find it',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      DefaultTextButton(
                        onPressed: () {
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification()
                              .then((value) {
                            showToast(
                                message: 'Check your mail',
                                state: ToastState.success);
                          }).catchError((error) {
                            print(error.toString());
                          });
                        },
                        text: 'click here to resend',
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
