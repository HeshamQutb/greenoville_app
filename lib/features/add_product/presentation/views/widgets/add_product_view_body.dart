import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_product_cubit/add_product_cubit.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_product_cubit/add_product_states.dart';
import 'package:greenoville_app/features/add_product/presentation/views/widgets/product_loading_section.dart';
import 'package:greenoville_app/features/add_product/presentation/views/widgets/product_form.dart';
import 'package:greenoville_app/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>()];
  final List<TextEditingController> nameControllers = [TextEditingController()];
  final List<TextEditingController> priceControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> descriptionControllers = [
    TextEditingController()
  ];
  final List<File?> images = [null];
  final List<int> quantities = [1];

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddProductCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          if (cubit.state is AddProductLoadingState)
            const ProductLoadingSection(),
          Expanded(
            child: ListView.builder(
              itemCount: formKeys.length,
              itemBuilder: (context, index) {
                return ProductForm(
                  formKey: formKeys[index],
                  nameController: nameControllers[index],
                  priceController: priceControllers[index],
                  descriptionController: descriptionControllers[index],
                  image: images[index],
                  quantity: quantities[index],
                  onImageSelected: (image) =>
                      setState(() => images[index] = image),
                  onQuantityChanged: (quantity) =>
                      setState(() => quantities[index] = quantity),
                  onRemove: index > 0
                      ? () {
                    setState(() {
                      formKeys.removeAt(index);
                      nameControllers.removeAt(index);
                      priceControllers.removeAt(index);
                      descriptionControllers.removeAt(index);
                      images.removeAt(index);
                      quantities.removeAt(index);
                    });
                  }
                      : null,
                );
              },
            ),
          ),
          DefaultButton(
            text: S.of(context).addAnotherProduct,
            onPressed: () {
              setState(() {
                formKeys.add(GlobalKey<FormState>());
                nameControllers.add(TextEditingController());
                priceControllers.add(TextEditingController());
                descriptionControllers.add(TextEditingController());
                images.add(null);
                quantities.add(1);
              });
            },
          ),
          const SizedBox(height: 20),
          DefaultButton(
            text: S.of(context).addProducts,
            onPressed: () {
              bool allValid = true;
              for (var formKey in formKeys) {
                if (!(formKey.currentState?.validate() ?? false)) {
                  allValid = false;
                }
              }
              if (allValid) {
                for (int i = 0; i < formKeys.length; i++) {
                  if (images[i] != null) {
                    cubit.addProductWithImage(
                      context: context,
                      uId: uId!,
                      productName: nameControllers[i].text,
                      productImage: images[i]!,
                      productDescription: descriptionControllers[i].text,
                      productPrice: double.parse(priceControllers[i].text),
                      productUnit: S.of(context).kg,
                      productQuantity: quantities[i],
                      productId: const Uuid().v1(),
                    );
                  } else {
                    cubit.addNewProduct(
                      context: context,
                      uId: uId!,
                      productName: nameControllers[i].text,
                      productDescription: descriptionControllers[i].text,
                      productPrice: double.parse(priceControllers[i].text),
                      productUnit: S.of(context).kg,
                      productQuantity: quantities[i],
                      productId: const Uuid().v1(),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
