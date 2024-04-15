import 'package:flutter/material.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/cubit.dart';

import '../../../../../core/widgets/default_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class SignUpViewTextFieldSection extends StatelessWidget {
  const SignUpViewTextFieldSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.formKey,
    required this.signUpCubit,
    required this.role,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final String role;
  final GlobalKey<FormState> formKey;
  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextFormField(
          controller: nameController,
          type: TextInputType.name,
          validate: (value) {
            if (value!.isEmpty) {
              return S.of(context).pleaseEnterYourName;
            }
            return null;
          },
          label: S.of(context).name,
          prefixIcon: Icons.person,
        ),
        const SizedBox(
          height: 15,
        ),
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
          height: 15,
        ),
        DefaultTextFormField(
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
            signUpCubit.changePasswordVisibility();
          },
          suffix: signUpCubit.suffix,
          isPassword: signUpCubit.isPassword,
        ),
        const SizedBox(
          height: 15,
        ),
        DefaultTextFormField(
          controller: phoneController,
          type: TextInputType.phone,
          validate: (value) {
            if (value!.isEmpty) {
              return S.of(context).pleaseEnterPhoneNumber;
            }
            return null;
          },
          label: S.of(context).phone,
          prefixIcon: Icons.phone,
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              signUpCubit.userSignUp(
                context: context,
                email: emailController.text,
                password: passwordController.text,
                name: nameController.text,
                phone: phoneController.text,
                role: role,
              );
            }
          },
        ),
      ],
    );
  }
}
