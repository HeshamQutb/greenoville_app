import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/soils/presentation/views/widgets/soils_view_body_list_view_item.dart';

import '../../../../../generated/l10n.dart';
import '../../../../soil_type/presentation/views/soil_type_view.dart';

class SoilsViewBodyListView extends StatelessWidget {
  const SoilsViewBodyListView({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(
                context,
                SoilTypeView(
                  soilTypeName: S.of(context).claySoil,
                  soilImage: AssetsData.clay,
                  appCubit: appCubit,
                  soilType: 'clay',
                ),
              );
            },
            child: SoilsViewBodyListViewItem(
              soilImage: AssetsData.claySoil,
              soilName: S.of(context).claySoil,
              imageRight: true,
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(
                context,
                SoilTypeView(
                  soilTypeName: S.of(context).sandySoil,
                  soilImage: AssetsData.sandy,
                  appCubit: appCubit,
                  soilType: 'sandy',
                ),
              );
            },
            child: SoilsViewBodyListViewItem(
              soilImage: AssetsData.sandySoil,
              soilName: S.of(context).sandySoil,
              imageRight: false,
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(
                context,
                SoilTypeView(
                  soilTypeName: S.of(context).siltySoil,
                  soilImage: AssetsData.silty,
                  appCubit: appCubit,
                  soilType: 'silty',
                ),
              );
            },
            child: SoilsViewBodyListViewItem(
              soilImage: AssetsData.siltySoil,
              soilName: S.of(context).siltySoil,
              imageRight: true,
            ),
          ),
          InkWell(
            onTap: () {
              navigateTo(
                context,
                SoilTypeView(
                  soilTypeName: S.of(context).loamSoil,
                  soilImage: AssetsData.loam,
                  appCubit: appCubit,
                  soilType: 'loam',
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
      ),
    );
  }
}
