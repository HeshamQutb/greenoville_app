import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/features/add_product/presentation/views/add_product_view.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_cubit.dart';
import 'package:greenoville_app/features/farm/presentation/views/widgets/farm_information_section.dart';
import 'package:greenoville_app/features/farm/presentation/views/widgets/farm_products_section_builder.dart';

import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../../create_farm/data/models/farm_model.dart';

class FarmViewBody extends StatelessWidget {
  const FarmViewBody({
    super.key,
    required this.farmCubit,
    required this.farm,
  });

  final FarmCubit farmCubit;
  final FarmModel farm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Farm Information
          FarmInformationSection(
            farmCubit: farmCubit,
            farm: farm,
          ),
          // Produce Preview
          Expanded(
            child: FarmProductSectionBuilder(
              uid: farm.uId,
            ),
          ),
          if (farm.uId == uId)
            DefaultButton(
              onPressed: () {
                navigateTo(
                  context,
                  const AddProductView(),
                );
              },
              text: S.of(context).addProduct,
            )
        ],
      ),
    );
  }
}
