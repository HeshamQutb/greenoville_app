import 'package:flutter/material.dart';
import '../../view_model/add_post_cubit/add_post_cubit.dart';

class AddPostImageSection extends StatelessWidget {
  const AddPostImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(AddPostCubit.get(context).postImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 15,
            child: InkWell(
              onTap: () {
                AddPostCubit.get(context).removePostImage();
              },
              child: const Icon(
                Icons.close,
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
