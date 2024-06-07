import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/core/widgets/default_text_form_field.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_post_cubit/add_product_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/add_post_cubit/add_product_states.dart';
import 'add_product_view_image_section.dart';
import 'add_product_view_quantity_section.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({
    super.key,
    required this.state,
    required this.addProductCubit,
    required this.productFormKeys,
    required this.productNameControllers,
    required this.productPriceControllers,
    required this.productQuantityControllers,
    required this.productDescriptionControllers,
    required this.productImages,
  });
  final AddProductCubit addProductCubit;
  final AddProductStates state;
  final List<GlobalKey<FormState>> productFormKeys;

  final List<TextEditingController> productNameControllers;

  final List<File?> productImages;

  final List<TextEditingController> productPriceControllers;

  final List<int> productQuantityControllers;

  final List<TextEditingController> productDescriptionControllers;

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: Column(
        children: [
          if (widget.state is AddProductLoadingState)
            const LinearProgressIndicator(),
          if (widget.state is AddProductLoadingState)
            const SizedBox(
              height: 8,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.productFormKeys.length,
              itemBuilder: (context, index) {
                return Form(
                  key: widget.productFormKeys[index],
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).productImage,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AddProductImageSection(
                            addProductCubit: widget.addProductCubit,
                            productImage: widget.productImages[index],
                            onImageSelected: (image) {
                              setState(() {
                                widget.productImages[index] = image;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DefaultTextFormField(
                            radius: 12,
                            controller: widget.productNameControllers[index],
                            type: TextInputType.text,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterProductName;
                              }
                              return null;
                            },
                            label: S.of(context).productName,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DefaultTextFormField(
                            radius: 12,
                            controller:
                                widget.productDescriptionControllers[index],
                            type: TextInputType.multiline,
                            validate: (value) {
                              return null;
                            },
                            label: S.of(context).productDescription,
                            maxLines: 4,
                            helperText: '(${S.of(context).optional})*',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          DefaultTextFormField(
                            prefixIcon: Icons.attach_money,
                            radius: 12,
                            controller: widget.productPriceControllers[index],
                            type: TextInputType.number,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterProductPrice;
                              }
                              return null;
                            },
                            label:
                                '${S.of(context).productPrice} (${S.of(context).kg})',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AddProductViewQuantitySection(
                            quantityController:
                                widget.productQuantityControllers[index],
                            onQuantityChanged: (value) {
                              setState(() {
                                widget.productQuantityControllers[index] =
                                    value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (index > 0)
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.productFormKeys.removeAt(index);
                                    widget.productNameControllers
                                        .removeAt(index);
                                    widget.productImages.removeAt(index);
                                    widget.productPriceControllers
                                        .removeAt(index);
                                    widget.productQuantityControllers
                                        .removeAt(index);
                                    widget.productDescriptionControllers
                                        .removeAt(index);
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          DefaultButton(
            onPressed: () {
              setState(() {
                widget.productFormKeys.add(GlobalKey<FormState>());
                widget.productNameControllers.add(TextEditingController());
                widget.productImages.add(null);
                widget.productPriceControllers.add(TextEditingController());
                widget.productQuantityControllers.add(1);
                widget.productDescriptionControllers
                    .add(TextEditingController());
              });
            },
            text: S.of(context).addAnotherProduct,
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButton(
            onPressed: () {
              bool allValid = true;

              // Validate all form keys
              for (var formKey in widget.productFormKeys) {
                if (!(formKey.currentState?.validate() ?? false)) {
                  allValid = false;
                }
              }

              if (allValid) {
                // Process form data if all validations pass
                for (int i = 0; i < widget.productFormKeys.length; i++) {
                  if (widget.productImages[i] != null) {
                    widget.addProductCubit.uploadProductImage(
                      context: context,
                      uId: uId!,
                      productName: widget.productNameControllers[i].text,
                      productImage: widget.productImages[i]!,
                      productDescription:
                          widget.productDescriptionControllers[i].text,
                      productPrice:
                          double.parse(widget.productPriceControllers[i].text),
                      productUnit: S.of(context).kg,
                      productQuantity: widget.productQuantityControllers[i],
                    );
                  } else {
                    widget.addProductCubit.addNewProduct(
                      context: context,
                      uId: uId!,
                      productName: widget.productNameControllers[i].text,
                      productDescription:
                          widget.productDescriptionControllers[i].text,
                      productPrice:
                          double.parse(widget.productPriceControllers[i].text),
                      productUnit: S.of(context).kg,
                      productQuantity: widget.productQuantityControllers[i],
                    );
                  }
                }
              }
            },
            text: S.of(context).addProducts,
          ),
        ],
      ),
    );
  }
}
