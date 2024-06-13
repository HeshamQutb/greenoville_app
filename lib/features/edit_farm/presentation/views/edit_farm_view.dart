import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_post_cubit/edit_farm_cubit.dart';
import '../view_model/add_post_cubit/edit_farm_states.dart';
import 'widgets/edit_farm_view_body.dart';

class EditFarmView extends StatelessWidget {
  const EditFarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditFarmCubit(),
      child: BlocConsumer<EditFarmCubit, EditFarmStates>(
        listener: (context, state) {
          if (state is EditFarmSuccessState) {
            showToast(
              message: S.of(context).successfullyCreateFarm,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).editFarm,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: EditFarmViewBody(
              state: state,
            ),
          );
        },
      ),
    );
  }
}
