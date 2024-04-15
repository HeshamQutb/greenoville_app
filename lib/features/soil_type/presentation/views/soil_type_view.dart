import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/soil_type/presentation/views/widgets/soil_type_view_body.dart';

import '../view_model/soil_type_list_items.dart';

class SoilTypeView extends StatelessWidget {
  const SoilTypeView(
      {super.key,
      required this.soilTypeName,
      required this.soilImage,
      required this.appCubit});
  final String soilTypeName;
  final String soilImage;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor, // Assuming kPrimaryColor is defined somewhere
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SoilTypeViewBody(
            items: soilTypeListItems(context),
            soilTypeName: soilTypeName,
            soilTypeImage: soilImage,
            appCubit: appCubit,
          ),
        ),
      ),
    );
  }
}
