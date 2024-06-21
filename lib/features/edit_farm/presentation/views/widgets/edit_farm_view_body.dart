import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../create_farm/data/models/farm_model.dart';
import '../../view_model/edit_farm_cubit/edit_farm_cubit.dart';
import '../../view_model/edit_farm_cubit/edit_farm_states.dart';
import 'edit_farm_pick_image_section.dart';

class EditFarmViewBody extends StatefulWidget {
  const EditFarmViewBody({
    super.key,
    required this.state,
    required this.farm,
    required this.farmNameController,
    required this.farmOwnerNameController,
    required this.farmLocationController,
  });
  final EditFarmStates state;
  final FarmModel farm;
  final TextEditingController farmNameController;
  final TextEditingController farmOwnerNameController;
  final TextEditingController farmLocationController;
  @override
  State<EditFarmViewBody> createState() => _EditFarmViewBodyState();
}

class _EditFarmViewBodyState extends State<EditFarmViewBody> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.farmNameController.text = widget.farm.farmName;
    widget.farmOwnerNameController.text = widget.farm.farmOwnerName;
    widget.farmLocationController.text = widget.farm.farmLocation;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFarmCubit, EditFarmStates>(
      builder: (context, state) {
        var editFarmCubit = EditFarmCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            children: [
              if (state is EditFarmLoadingState)
                const LinearProgressIndicator(),
              if (state is EditFarmLoadingState)
                const SizedBox(
                  height: 8,
                ),
              Flexible(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditFarmPickImageSection(
                          editFarmCubit: editFarmCubit,
                          farm: widget.farm,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DefaultTextFormField(
                          controller: widget.farmNameController,
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
                          controller: widget.farmOwnerNameController,
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
                          controller: widget.farmLocationController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterFarmLocation;
                            }
                            return null;
                          },
                          onFieldSubmitted: (String value) {
                            if (formKey.currentState!.validate()) {
                              editFarmCubit.uploadFarmImage(
                                  context: context,
                                  uId: widget.farm.uId,
                                  farmName: widget.farmNameController.text,
                                  farmOwnerName:
                                      widget.farmOwnerNameController.text,
                                  farmLocation:
                                      widget.farmLocationController.text,
                                  farmId: widget.farm.uId,
                                  hasProducts: widget.farm.hasProducts,
                                  currentFarmImageUrl: widget.farm.farmImage!
                                  );
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
                          editFarmCubit.uploadFarmImage(
                              context: context,
                              uId: widget.farm.uId,
                              farmName: widget.farmNameController.text,
                              farmOwnerName:
                              widget.farmOwnerNameController.text,
                              farmLocation:
                              widget.farmLocationController.text,
                              farmId: widget.farm.uId,
                              hasProducts: widget.farm.hasProducts,
                              currentFarmImageUrl: widget.farm.farmImage!
                          );
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
