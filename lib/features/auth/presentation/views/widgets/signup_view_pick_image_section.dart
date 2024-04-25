import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/cubit.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';

class SignUpViewPickImageSection extends StatelessWidget {
  const SignUpViewPickImageSection({
    super.key,
    required this.signUpCubit,
    required this.profileImage,
  });

  final SignUpCubit signUpCubit;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: profileImage != null ? 190 : 140,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(profileImage != null)
                          ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -2),
                          leading: const Icon(Icons.no_photography),
                          title: Text(S.of(context).removeImage),
                          onTap: () {
                            signUpCubit.removeProfileImage();
                            Navigator.pop(context);
                          },
                        ),
                        if(profileImage != null)
                          const Divider(
                          height: 1.0,
                        ),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -2),
                          leading: const Icon(Icons.camera_alt),
                          title: Text(S.of(context).takePhoto),
                          onTap: () {
                            signUpCubit.getProfileImage(
                                source: ImageSource.camera, context: context);
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: const Icon(Icons.image),
                          title: Text(S.of(context).chooseFromGallery),
                          onTap: () {
                            signUpCubit.getProfileImage(
                                source: ImageSource.gallery, context: context);
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(
                          height: 1.0,
                        ),
                        DefaultTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: S.of(context).cancel,
                          size: 15,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  radius: 35,
                  backgroundImage: profileImage == null
                      ? const AssetImage(AssetsData.unknownUser)
                      : FileImage(profileImage!) as ImageProvider,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 8,
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
