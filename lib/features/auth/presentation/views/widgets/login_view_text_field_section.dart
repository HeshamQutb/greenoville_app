import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/default_text_form_field.dart';
import '../../../../../generated/l10n.dart';
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
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            DefaultTextFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              validate: (value) {
                if (value!.isEmpty) {
                  return S.of(context).pleaseEnterEmailAddress;
                }
                return null;
              },
              label: S.of(context).emailAddress,
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultTextFormField(
              onFieldSubmitted: (value) {
                if (formKey.currentState!.validate()) {
                  loginCubit.userLogin(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context,
                  );
                }
              },
              controller: passwordController,
              type: TextInputType.text,
              validate: (value) {
                if (value!.isEmpty) {
                  return S.of(context).passwordIsTooShort;
                }
                return null;
              },
              label: S.of(context).password,
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
