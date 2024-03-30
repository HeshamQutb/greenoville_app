import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'widgets/soils_view_body.dart';

class SoilsView extends StatelessWidget {
  const SoilsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          title: 'Soils',
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SoilsViewBody(),
          ),
        ),
      ],
    );
  }
}

