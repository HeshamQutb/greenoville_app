
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/icon_broken.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import 'package:greenoville_app/features/edit_profile/presentation/views/widgets/edit_profile_images_section.dart';
import '../../../../core/services/toast_services.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/user_model.dart';
import '../view_model/account_cubit/edit_profile_cubit.dart';
import '../view_model/account_cubit/edit_profile_states.dart';

class EditProfileView extends StatefulWidget {
   EditProfileView({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    widget.nameController.text = widget.userModel.userName;
    widget.phoneController.text = widget.userModel.userPhone;
    widget.emailController.text = widget.userModel.userEmail;
    widget.bioController.text = widget.userModel.bio;
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if(state is EditProfileSuccessState){
            Navigator.pop(context, state.updatedUser);
            showToast(
              message: S.of(context).successfullyEditProfile,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {

          var profileImage = EditProfileCubit.get(context).newProfileImage;
          var coverImage = EditProfileCubit.get(context).newCoverImage;

          return Scaffold(
            appBar: CustomAppBar(
              leadingAction: () {
                Navigator.pop(context);
              },
              title: S.of(context).editProfile,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  if(state is EditProfileLoadingState)
                    const LinearProgressIndicator(),
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            EditProfileImagesSection(coverImage: coverImage, widget: widget, profileImage: profileImage),
                            const SizedBox(
                              height: 65,
                            ),
                            DefaultTextFormField(
                              controller: widget.nameController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleaseEnterYourName;
                                }
                                return null;
                              },
                              prefixIcon: Icons.person,
                            ),
                            const SizedBox(height: 8),
                            DefaultTextFormField(
                              controller: widget.phoneController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleaseEnterPhoneNumber;
                                }
                                return null;
                              },
                              prefixIcon: IconBroken.Call,
                            ),
                            const SizedBox(height: 8),
                            DefaultTextFormField(
                              controller: widget.emailController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleaseEnterEmailAddress;
                                }
                                return null;
                              },
                              prefixIcon: Icons.email,
                            ),
                            const SizedBox(height: 8),
                            DefaultTextFormField(
                              controller: widget.bioController,
                              validate: (value) => null,
                              maxLines: 4,
                              type: TextInputType.text,
                              prefixIcon: IconBroken.Info_Circle,
                            ),
                            const SizedBox(
                              height: 65,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DefaultButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        EditProfileCubit.get(context).updateUserProfile(
                          userName: widget.nameController.text,
                          userPhone: widget.phoneController.text,
                          userEmail: widget.emailController.text,
                          userImage: widget.userModel.userImage,
                          coverImage: widget.userModel.coverImage,
                          userRole: widget.userModel.userRole,
                          uId: widget.userModel.uId,
                          bio: widget.bioController.text,
                          isVerified: widget.userModel.isVerified,
                          hasFarm: widget.userModel.hasFarm,
                          hasTips: widget.userModel.hasTips,
                        );
                      }
                    },
                    text: S.of(context).save,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


