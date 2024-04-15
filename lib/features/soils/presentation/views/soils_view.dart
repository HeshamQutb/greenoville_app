import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import 'widgets/soils_view_body.dart';

class SoilsView extends StatelessWidget {
  const SoilsView({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    return Column(
      children: [
        const SizedBox(
          height: 38,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: SoilsViewBody(
                appCubit: appCubit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
