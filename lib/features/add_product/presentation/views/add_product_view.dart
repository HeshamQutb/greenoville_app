import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/services/toast_services.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_product_cubit/add_product_cubit.dart';
import 'package:greenoville_app/features/add_product/presentation/view_model/add_product_cubit/add_product_states.dart';
import 'package:greenoville_app/generated/l10n.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          if (state is AddProductSuccessState) {
            showToast(
              message: S.of(context).successfullyAddProduct,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              iconSize: 30,
              icon: Icons.close,
              title: S.of(context).addProduct,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: const AddProductViewBody(),
          );
        },
      ),
    );
  }
}
