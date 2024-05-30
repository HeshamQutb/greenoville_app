import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/toast_services.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/add_post_cubit/add_product_cubit.dart';
import '../view_model/add_post_cubit/add_product_states.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key, required this.appCubit});
  final textController = TextEditingController();
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        listener: (context, state) {
          if (state is AddProductSuccessState) {
            Navigator.pop(context);
            showToast(
              message: S.of(context).successfullyAddProduct,
              state: ToastState.success,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).addProduct,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: AddProductViewBody(
              textController: textController,
              state: state,
              appCubit: appCubit,
            ),
          );
        },
      ),
    );
  }
}
