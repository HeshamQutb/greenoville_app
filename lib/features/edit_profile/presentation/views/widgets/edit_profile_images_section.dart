import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../view_model/account_cubit/edit_profile_cubit.dart';
import '../edit_profile_view.dart';

class EditProfileImagesSection extends StatelessWidget {
  const EditProfileImagesSection({
    super.key,
    required this.coverImage,
    required this.widget,
    required this.profileImage,
  });

  final File? coverImage;
  final EditProfileView widget;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            EditProfileCubit.get(context)
                .pickCoverImage();
          },
          child: Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: coverImage == null
                    ? CachedNetworkImageProvider(
                  widget.userModel.coverImage,
                )
                    : FileImage(coverImage!)
                as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          child: InkWell(
            onTap: () {
              EditProfileCubit.get(context)
                  .pickProfileImage();
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context)
                  .scaffoldBackgroundColor,
              radius: 62,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profileImage == null
                    ? CachedNetworkImageProvider(
                  widget.userModel.userImage,
                )
                    : FileImage(profileImage!)
                as ImageProvider,
              ),
            ),
          ),
        ),
      ],
    );
  }
}