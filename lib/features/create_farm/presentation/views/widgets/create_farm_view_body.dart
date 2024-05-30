import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/add_post_cubit/create_farm_cubit.dart';
import '../../view_model/add_post_cubit/create_farm_states.dart';
import 'create_farm_pick_image_section.dart';

class CreateFarmViewBody extends StatefulWidget {
  const CreateFarmViewBody({
    super.key,
    required this.state,
  });
  final CreateFarmStates state;

  @override
  State<CreateFarmViewBody> createState() => _CreateFarmViewBodyState();
}

class _CreateFarmViewBodyState extends State<CreateFarmViewBody> {
  final formKey = GlobalKey<FormState>();

  final farmNameController = TextEditingController();
  final farmOwnerNameController = TextEditingController();
  final farmLocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateFarmCubit, CreateFarmStates>(
      builder: (context, state) {
        var createFarmCubit = CreateFarmCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CreateFarmPickImageSection(
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
              state is CreateFarmLoadingState
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
                      text: S.of(context).createFarm,
                    ),
            ],
          ),
        );
      },
    );
  }
}
