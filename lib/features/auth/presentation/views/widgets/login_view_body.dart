import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../core/widgets/default_text_field.dart';
import '../../../../root/presentation/views/root_view.dart';
import 'go_to_signup_section.dart';
import 'login_text_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: kVerticalPadding),
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
                const LoginTextSection(),
                const SizedBox(
                  height: 20,
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
                  height: 20,
                ),
                DefaultTextField(
                  onFieldSubmitted: (value) {
                    if (formKey.currentState!.validate()) {}
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
                  onPressedSuffix: () {},
                  suffix: Icons.visibility,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: DefaultTextButton(
                    onPressed: () {},
                    text: 'Forgot Password?',
                    isUpperCase: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  function: () {
                    // if (formKey.currentState!.validate()) {}
                    navigateAndFinish(context, const RootView());
                  },
                  text: 'Login',
                  radius: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                const GoToSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




