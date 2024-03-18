import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/verification_view_cubit/cubit.dart';
import 'package:greenoville_app/features/auth/presentation/views/widgets/verification_view_body.dart';
import '../../../../constants.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: VerificationViewBody(),
        ),
      ),
    );
  }
}
