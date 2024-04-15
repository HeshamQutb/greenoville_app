import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soils_view_body_list_view_item.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soils_view_custom_app_bar.dart';

import '../../../../../generated/l10n.dart';
import '../../../../soil_type/presentation/views/soil_type_view.dart';

class SoilsViewBodyListView extends StatelessWidget {
  const SoilsViewBodyListView({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SoilsViewCustomAppBar(
          appCubit: appCubit,
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              SoilTypeView(
                soilTypeName: S.of(context).claySoil,
                soilImage: AssetsData.clay,
                appCubit: appCubit,
              ),
            );
          },
          child: SoilsViewBodyListViewItem(
            soilImage: AssetsData.claySoil,
            soilName: S.of(context).claySoil,
            imageRight: true,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              SoilTypeView(
                soilTypeName: S.of(context).sandySoil,
                soilImage: AssetsData.sandy,
                appCubit: appCubit,
              ),
            );
          },
          child: SoilsViewBodyListViewItem(
            soilImage: AssetsData.sandySoil,
            soilName: S.of(context).sandySoil,
            imageRight: false,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              SoilTypeView(
                soilTypeName: S.of(context).siltySoil,
                soilImage: AssetsData.silty,
                appCubit: appCubit,
              ),
            );
          },
          child: SoilsViewBodyListViewItem(
            soilImage: AssetsData.siltySoil,
            soilName: S.of(context).siltySoil,
            imageRight: true,
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(
              context,
              SoilTypeView(
                soilTypeName: S.of(context).loamSoil,
                soilImage: AssetsData.loam,
                appCubit: appCubit,
              ),
            );
          },
          child: SoilsViewBodyListViewItem(
            soilImage: AssetsData.loamSoil,
            soilName: S.of(context).loamSoil,
            imageRight: false,
          ),
        ),
      ],
    );
  }
}
