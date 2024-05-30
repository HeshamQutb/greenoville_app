import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/app_cubit/app_cubit.dart';
import '../../view_model/add_post_cubit/add_product_states.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({
    super.key,
    required this.textController,
    required this.state,
    required this.appCubit,
  });
  final AppCubit appCubit;
  final TextEditingController textController;
  final AddProductStates state;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        bottom: kHorizontalPadding,
      ),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
