import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/cubit.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var appCubit = AppCubit.get(context);
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          leadingAction: () {
            Navigator.pop(context);
          },
        ),
        body: SignUpViewBody(
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          phoneController: phoneController,
          formKey: formKey,
          appCubit: appCubit,
        ),
      ),
    );
  }
}
