import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../view_model/edit_post_cubit/edit_post_cubit.dart';

class EditPostImageSection extends StatefulWidget {
  const EditPostImageSection({
    super.key,
    this.postImage,
    required this.removePostImage,
  });

  final String? postImage;
  final VoidCallback removePostImage;

  @override
  State<EditPostImageSection> createState() => _EditPostImageSectionState();
}

class _EditPostImageSectionState extends State<EditPostImageSection> {
  @override
  Widget build(BuildContext context) {
    if (widget.postImage == null) {
      return const SizedBox.shrink();
    }

    var imageProvider =
        widget.postImage != null && Uri.parse(widget.postImage!).isAbsolute
            ? CachedNetworkImageProvider(widget.postImage!) as ImageProvider
            : widget.postImage != null && widget.postImage!.isNotEmpty
                ? FileImage(File(widget.postImage!))
                : null;

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: imageProvider as ImageProvider<Object>,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 20,
            child: InkWell(
              onTap: EditPostCubit.get(context).postImage != null
                  ? () {
                      EditPostCubit.get(context).removePostImage();
                    }
                  : widget.removePostImage,
              child: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
