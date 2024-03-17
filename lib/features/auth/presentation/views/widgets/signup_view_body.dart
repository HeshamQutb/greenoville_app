import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/views/verification_view.dart';

import 'package:greenoville_app/features/auth/presentation/views/widgets/signup_view_text_section.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/signup_view_pick_image_section.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/services/toast_services.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../view_model/signup_view_cubit/cubit.dart';
import '../../view_model/signup_view_cubit/states.dart';
import 'signup_view_text_field_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.formKey,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          navigateTo(context, const VerificationView());
          showToast(
            message: 'Check your mail',
            state: ToastState.success,
          );
        }
        if (state is SignUpErrorState) {
          showToast(
            message: state.error.toString(),
            state: ToastState.error,
          );
        }
      },
      builder: (context, state) {
        var signUpCubit = SignUpCubit.get(context);
        var profileImage = SignUpCubit.get(context).profileImage;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: SignUpViewTextSection()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SignUpViewPickImageSection(
                    signUpCubit: signUpCubit,
                    profileImage: profileImage,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SignUpViewTextFieldSection(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    phoneController: phoneController,
                    formKey: formKey,
                    signUpCubit: signUpCubit,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        signUpCubit.userSignUp(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                        );
                      }
                    },
                    text: 'Sign up',
                    isUpperCase: false,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'have an account !',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DefaultTextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Login',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
