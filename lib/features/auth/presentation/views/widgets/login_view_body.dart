import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/login_view_cubit/cubit.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/login_view_cubit/states.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/services/toast_services.dart';
import '../../../../../core/widgets/custom_progress.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../root/presentation/views/root_view.dart';
import '../signup_view.dart';
import 'login_view_text_field_section.dart';
import 'login_view_text_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.appCubit,
  });
  final AppCubit appCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(
            message: state.error,
            state: ToastState.error,
          );
        }
        if (state is LoginSuccessState) {
          CacheHelper.setData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            uId = CacheHelper.getData(key: 'uId');
            navigateAndFinish(
              context,
              const RootView(),
            );
          });
          showToast(
            message: S.of(context).successfullyLogin,
            state: ToastState.success,
          );
        }
      },
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
              vertical: kVerticalPadding,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Image.asset(
                      AssetsData.login,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginViewTextSection(
                    loginCubit: loginCubit,
                    appCubit: appCubit,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginTextFieldSection(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                    loginCubit: loginCubit,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: DefaultTextButton(
                      onPressed: () {},
                      text: S.of(context).forgotPassword,
                      isUpperCase: false,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is! LoginLoadingState
                      ? DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              loginCubit.userLogin(
                                userEmail: emailController.text,
                                password: passwordController.text,
                                context: context,
                              );
                            }
                          },
                          text: S.of(context).login,
                        )
                      : const CustomProgressIndicator(),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).dontHaveAccount,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DefaultTextButton(
                        onPressed: () {
                          navigateTo(
                            context,
                            const SignUpView(),
                          );
                        },
                        text: S.of(context).signUp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
