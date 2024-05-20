import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/select_user_role_section.dart';

import 'package:greenoville_app/features/auth/presentation/views/widgets/signup_view_text_section.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/signup_view_pick_image_section.dart';
import 'package:greenoville_app/features/root/presentation/views/root_view.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/services/toast_services.dart';
import '../../../../../core/widgets/custom_progress.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
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
    required this.appCubit,
  });
  final AppCubit appCubit;
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
          navigateAndFinish(context, const RootView());
          showToast(
            message: S.of(context).signUpSuccessfully,
            state: ToastState.success,
          );
        }
        if (state is SignUpErrorState) {
          showToast(
            message: state.error,
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
                  Center(
                      child: SignUpViewTextSection(
                    appCubit: appCubit,
                  )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SignUpViewPickImageSection(
                    signUpCubit: signUpCubit,
                    profileImage: profileImage,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SignUpViewTextFieldSection(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    phoneController: phoneController,
                    formKey: formKey,
                    signUpCubit: signUpCubit,
                    role: signUpCubit.role,
                  ),
                  SelectUserRoleSection(
                    signUpCubit: signUpCubit,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  state is! SignUpLoadingState
                      ? DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              signUpCubit.userSignUp(
                                userEmail: emailController.text,
                                password: passwordController.text,
                                userName: nameController.text,
                                userPhone: phoneController.text,
                                userRole: signUpCubit.role,
                                context: context,
                              );
                            }
                          },
                          text: S.of(context).signUp,
                          isUpperCase: false,
                        )
                      : const CustomProgressIndicator(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).haveAccount,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DefaultTextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: S.of(context).login,
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