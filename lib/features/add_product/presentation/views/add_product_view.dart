import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_post_cubit/add_product_cubit.dart';
import '../view_model/add_post_cubit/add_product_states.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({
    super.key,
  });

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final List<GlobalKey<FormState>> productFormKeys = [GlobalKey<FormState>()];

  final List<File?> productImages = [null];

  final List<TextEditingController> productNameControllers = [
    TextEditingController()
  ];

  final List<TextEditingController> productPriceControllers = [
    TextEditingController()
  ];

  final List<int> productQuantityControllers = [
    1,
  ];

  final List<TextEditingController> productDescriptionControllers = [
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          if (state is AddProductSuccessState) {
            Navigator.pop(context);
            Navigator.pop(context);
            showToast(
              message: S.of(context).successfullyAddProduct,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          AddProductCubit addProductCubit = AddProductCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              iconSize: 30,
              icon: Icons.close,
              title: S.of(context).addProduct,
              leadingAction: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            body: AddProductViewBody(
              state: state,
              addProductCubit: addProductCubit,
              productFormKeys: productFormKeys,
              productNameControllers: productNameControllers,
              productImages: productImages,
              productPriceControllers: productPriceControllers,
              productQuantityControllers: productQuantityControllers,
              productDescriptionControllers: productDescriptionControllers,
            ),
          );
        },
      ),
    );
  }
}
