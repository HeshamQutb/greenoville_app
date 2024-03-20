import 'package:flutter/material.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/cubit.dart';

import '../../../../../core/widgets/default_text_field.dart';

class SignUpViewTextFieldSection extends StatelessWidget {
  const SignUpViewTextFieldSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.formKey,
    required this.signUpCubit,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;
  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextField(
          controller: nameController,
          type: TextInputType.name,
          validate: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Your Name!';
            }
            return null;
          },
          label: 'Name',
          prefixIcon: Icons.person,
        ),
        const SizedBox(
          height: 15,
        ),
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
        ),
        const SizedBox(
          height: 15,
        ),
        DefaultTextField(
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
            signUpCubit.changePasswordVisibility();
          },
          suffix: signUpCubit.suffix,
          isPassword: signUpCubit.isPassword,
        ),
        const SizedBox(
          height: 15,
        ),
        DefaultTextField(
          controller: phoneController,
          type: TextInputType.phone,
          validate: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Phone Number!';
            }
            return null;
          },
          label: 'Phone',
          prefixIcon: Icons.phone,
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              signUpCubit.userSignUp(
                email: emailController.text,
                password: passwordController.text,
                name: nameController.text,
                phone: phoneController.text,
              );
            }
          },
        ),
      ],
    );
  }
}
