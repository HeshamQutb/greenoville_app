import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/cubit.dart';
import 'package:greenoville_app/features/auth/presentation/view_model/signup_view_cubit/states.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/default_text_button.dart';

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
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 140,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -2),
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Take a photo'),
                          onTap: () {
                            signUpCubit.getProfileImageCamera();
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          leading: const Icon(Icons.image),
                          title: const Text('Choose from gallery'),
                          onTap: () {
                            signUpCubit.getProfileImageGallery();
                            Navigator.pop(context);
                          },
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        DefaultTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
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
                  radius: 40,
                  backgroundImage: profileImage == null
                      ? const AssetImage(AssetsData.unknownUser)
                      : FileImage(profileImage!) as ImageProvider,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 10,
                  child: Icon(
                    Icons.add,
                    size: 18,
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
