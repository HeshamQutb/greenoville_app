import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_post_cubit/add_product_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/default_text_button.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/add_post_cubit/add_product_states.dart';

class AddProductViewPickImage extends StatelessWidget {
  const AddProductViewPickImage({
    super.key,

    required this.productImage, required this.addProductCubit,
  });
  final AddProductCubit addProductCubit;
  final File? productImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: productImage != null ? 190 : 140,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(productImage != null)
                        ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -2),
                        leading: const Icon(Icons.no_photography),
                        title: Text(S.of(context).removeImage),
                        onTap: () {
                          addProductCubit.removeProductImage();
                          Navigator.pop(context);
                        },
                      ),
                      if(productImage != null)
                        const Divider(
                        height: 1.0,
                      ),
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -2),
                        leading: const Icon(Icons.camera_alt),
                        title: Text(S.of(context).takePhoto),
                        onTap: () {
                          addProductCubit.getProductImage(
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
                          addProductCubit.getProductImage(
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
                backgroundImage: productImage == null
                    ? const AssetImage(AssetsData.unknownUser)
                    : FileImage(productImage!) as ImageProvider,
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
        );
      },
    );
  }
}
