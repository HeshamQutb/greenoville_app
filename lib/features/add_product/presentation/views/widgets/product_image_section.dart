import 'dart:io';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({
    super.key,
    this.image,
    required this.onImageSelected,
  });
  final File? image;
  final Function(File?) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          final imageFile = File(pickedFile.path);
          onImageSelected(imageFile);
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: image != null
                    ? FileImage(image!)
                    : const AssetImage(AssetsData.addImage) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (image != null)
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: IconButton(
                  onPressed: () => onImageSelected(null),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
