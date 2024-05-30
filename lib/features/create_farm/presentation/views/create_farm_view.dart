import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/toast_services.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_post_cubit/create_farm_cubit.dart';
import '../view_model/add_post_cubit/create_farm_states.dart';
import 'widgets/create_farm_view_body.dart';

class CreateFarmView extends StatelessWidget {
  const CreateFarmView({
    super.key,
    required this.appCubit,
  });
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFarmCubit(),
      child: BlocConsumer<CreateFarmCubit, CreateFarmStates>(
        listener: (context, state) {
          if (state is CreateFarmSuccessState) {
            // Navigator.pop(context);
            showToast(
              message: S.of(context).successfullyCreateFarm,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).createFarm,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: CreateFarmViewBody(
              state: state,
              appCubit: appCubit,
            ),
          );
        },
      ),
    );
  }
}
