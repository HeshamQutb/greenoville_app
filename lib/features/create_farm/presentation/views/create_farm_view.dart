import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/features/add_product/presentation/views/add_product_view.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_farm_cubit/create_farm_cubit.dart';
import '../view_model/add_farm_cubit/create_farm_states.dart';
import 'widgets/create_farm_view_body.dart';

class CreateFarmView extends StatelessWidget {
  const CreateFarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFarmCubit(),
      child: BlocConsumer<CreateFarmCubit, CreateFarmStates>(
        listener: (context, state) {
          if (state is CreateFarmSuccessState) {
            showToast(
              message: S.of(context).successfullyCreateFarm,
              state: ToastState.success,
            );
            Navigator.pop(context);
            navigateTo(
              context,
              const AddProductView(),
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
            ),
          );
        },
      ),
    );
  }
}
