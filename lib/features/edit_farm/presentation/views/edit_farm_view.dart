import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../create_farm/data/models/farm_model.dart';
import '../view_model/edit_farm_cubit/edit_farm_cubit.dart';
import '../view_model/edit_farm_cubit/edit_farm_states.dart';
import 'widgets/edit_farm_view_body.dart';

class EditFarmView extends StatelessWidget {
  EditFarmView({
    super.key,
    required this.farm,
  });
  final FarmModel farm;
  final formKey = GlobalKey<FormState>();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController farmOwnerNameController = TextEditingController();
  final TextEditingController farmLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    farmNameController.text = farm.farmName;
    farmOwnerNameController.text = farm.farmOwnerName;
    farmLocationController.text = farm.farmLocation;
    return BlocProvider(
      create: (context) => EditFarmCubit(),
      child: BlocConsumer<EditFarmCubit, EditFarmStates>(
        listener: (context, state) {
          if (state is EditFarmSuccessState) {
            showToast(
              message: S.of(context).successfullyEditFarm,
              state: ToastState.success,
            );
            Navigator.pop(context);
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
              farm: farm,
              farmNameController: farmNameController,
              farmOwnerNameController: farmOwnerNameController,
              farmLocationController: farmLocationController,
            ),
          );
        },
      ),
    );
  }
}
