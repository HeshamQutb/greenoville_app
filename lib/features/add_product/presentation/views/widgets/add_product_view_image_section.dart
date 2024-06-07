import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_post_cubit/add_product_cubit.dart';

class AddProductImageSection extends StatelessWidget {
  const AddProductImageSection({
    super.key,
    required this.addProductCubit,
    this.productImage,
    required this.onImageSelected,
  });
  final AddProductCubit addProductCubit;
  final File? productImage;
  final Function(File) onImageSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final image =
            await AddProductCubit.get(context).getProductImageGallery(context);
        if (image != null) {
          onImageSelected(image);
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
                image: productImage != null
                    ? FileImage(productImage!)
                    : const AssetImage(AssetsData.addImage) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (productImage != null)
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 15,
                child: InkWell(
                  onTap: () {
                    AddProductCubit.get(context).removeProductImage();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
