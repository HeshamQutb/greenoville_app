import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/farm/presentation/views/farm_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/market_farm_model.dart';
import '../../view_model/market_cubit/market_cubit.dart';
import 'farm_information_section.dart';
import 'farm_products_section_builder.dart';

class MarketViewListViewItem extends StatelessWidget {
  const MarketViewListViewItem({
    super.key,
    required this.farm,
    required this.marketCubit,
  });
  final MarketCubit marketCubit;
  final MarketFarmModel? farm;

  @override
  Widget build(BuildContext context) {
    if (farm == null) {
      return const SizedBox.shrink();
    }
    return Card(
      surfaceTintColor: Colors.grey[500],
      color: Colors.white,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: InkWell(
          onTap: () {
            navigateTo(
              context,
              FarmView(
                uid: farm!.uId,
                showAppBar: true,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Farm Information
              FarmInformationSection(
                marketCubit: marketCubit,
                farm: farm!,
              ),
              // Produce Preview
              FarmProductSectionBuilder(
                uid: farm!.uId,
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton(
                onPressed: () {
                  navigateTo(
                    context,
                    FarmView(
                      uid: farm!.uId,
                      showAppBar: true,
                    ),
                  );
                },
                child: Text(
                  S.of(context).seeMore,
                  style: const TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
