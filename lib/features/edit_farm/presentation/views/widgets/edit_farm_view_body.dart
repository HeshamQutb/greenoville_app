import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/add_post_cubit/edit_farm_cubit.dart';
import '../../view_model/add_post_cubit/edit_farm_states.dart';
import 'create_farm_pick_image_section.dart';

class EditFarmViewBody extends StatefulWidget {
  const EditFarmViewBody({
    super.key,
    required this.state,
  });
  final EditFarmStates state;

  @override
  State<EditFarmViewBody> createState() => _EditFarmViewBodyState();
}

class _EditFarmViewBodyState extends State<EditFarmViewBody> {
  final formKey = GlobalKey<FormState>();

  final farmNameController = TextEditingController();
  final farmOwnerNameController = TextEditingController();
  final farmLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFarmCubit, EditFarmStates>(
      builder: (context, state) {
        var createFarmCubit = EditFarmCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            children: [
              if(state is EditFarmLoadingState)
                const LinearProgressIndicator(),
              if(state is EditFarmLoadingState)
                const SizedBox(height: 8,),
              Flexible(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditFarmPickImageSection(
                          createFarmCubit: createFarmCubit,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DefaultTextFormField(
                          controller: farmNameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterFarmName;
                            }
                            return null;
                          },
                          label: S.of(context).farmName,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DefaultTextFormField(
                          controller: farmOwnerNameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterOwnerName;
                            }
                            return null;
                          },
                          label: S.of(context).ownerName,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DefaultTextFormField(
                          controller: farmLocationController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterFarmLocation;
                            }
                            return null;
                          },
                          onFieldSubmitted: (String value){
                            if (formKey.currentState!.validate()) {
                              if (createFarmCubit.farmImage != null) {
                                createFarmCubit.uploadFarmImage(
                                  context: context,
                                  uId: kUserModel!.uId,
                                  farmName: farmNameController.text,
                                  farmOwnerName: farmOwnerNameController.text,
                                  farmLocation: farmLocationController.text,
                                  farmId: kUserModel!.uId,
                                );
                              } else {
                                createFarmCubit.createFarm(
                                  context: context,
                                  uId: kUserModel!.uId,
                                  farmName: farmNameController.text,
                                  farmOwnerName: farmOwnerNameController.text,
                                  farmLocation: farmLocationController.text,
                                );
                              }
                            }
                          },
                          label: S.of(context).farmLocation,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              state is EditFarmLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : DefaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (createFarmCubit.farmImage != null) {
                            createFarmCubit.uploadFarmImage(
                              context: context,
                              uId: kUserModel!.uId,
                              farmName: farmNameController.text,
                              farmOwnerName: farmOwnerNameController.text,
                              farmLocation: farmLocationController.text,
                              farmId: kUserModel!.uId,
                            );
                          } else {
                            createFarmCubit.createFarm(
                              context: context,
                              uId: kUserModel!.uId,
                              farmName: farmNameController.text,
                              farmOwnerName: farmOwnerNameController.text,
                              farmLocation: farmLocationController.text,
                            );
                          }
                        }
                      },
                      text: S.of(context).editFarm,
                    ),
            ],
          ),
        );
      },
    );
  }
}
