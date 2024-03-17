import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/default_text_field.dart';
import '../../view_model/login_view_cubit/cubit.dart';
import '../../view_model/login_view_cubit/states.dart';

class LoginTextFieldSection extends StatelessWidget {
  const LoginTextFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.loginCubit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    final FocusNode passwordFocusNode = FocusNode();
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            DefaultTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Email Address!';
                }
                return null;
              },
              label: 'Email Address',
              prefixIcon: Icons.email_outlined,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTextField(
              focusNode: passwordFocusNode,
              onFieldSubmitted: (value) {
                if (formKey.currentState!.validate()) {
                  loginCubit.userLogin(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              },
              controller: passwordController,
              type: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'Password is too short!';
                }
                return null;
              },
              label: 'Password',
              prefixIcon: Icons.lock,
              onPressedSuffix: () {
                loginCubit.changePasswordVisibility();
              },
              suffix: loginCubit.suffix,
              isPassword: loginCubit.isPassword,
            ),
          ],
        );
      },
    );
  }
}
