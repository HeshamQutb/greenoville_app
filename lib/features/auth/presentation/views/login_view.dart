import 'package:flutter/material.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
        body: LoginViewBody(
      emailController: emailController,
      passwordController: passwordController,
      formKey: formKey,
    ));
  }
}
