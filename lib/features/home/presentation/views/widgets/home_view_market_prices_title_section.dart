import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/market_prices/presentation/views/market_prices_view.dart';
import '../../../../../generated/l10n.dart';

class HomeViewMarketPricesTitleSection extends StatelessWidget {
  const HomeViewMarketPricesTitleSection(
      {super.key, required this.title, required this.appCubit});
  final String title;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            navigateTo(context, const MarketPricesView());
          },
          child: Text(
            S.of(context).seeAll,
            style: TextStyle(
              color: Colors.green,
              fontSize: appCubit.isArabic() ? 20 : null,
            ),
          ),
        ),
      ],
    );
  }
}
