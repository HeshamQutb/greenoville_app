import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_banner_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_custom_app_bar.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_latest_news_builder.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_location_and_weather_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_quick_action_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_latest_news_title_section.dart';
import 'package:greenoville_app/features/latest_news/presentation/views/latest_news_view.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';

import '../../../../../core/models/articles_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/data/models/user_model.dart';
import 'home_view_market_prices_title_section.dart';
import 'home_view_market_products_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.appCubit,
    required this.futureUser,
    required this.futureNews,
    required this.futureProduct,
  });
  final AppCubit appCubit;
  final Future<UserModel> futureUser;
  final Future<List<ArticlesModel>> futureNews;
  final Future<List<ProductModel>> futureProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeViewCustomAppBar(
          appCubit: appCubit,
          futureUser: futureUser,
        ),
        const SizedBox(height: 16),
        HomeViewBannerSection(
          appCubit: appCubit,
        ),
        const SizedBox(height: 16),
        const HomeViewLocationAndWeatherSection(),
        const SizedBox(height: 16),
        HomeViewQuickActionSection(
          appCubit: appCubit,
        ),
        const SizedBox(height: 16),
        HomeViewLatestNewsTitleSection(
          appCubit: appCubit,
          title: S.of(context).latestNews,
          widget: const LatestNewsView(),
        ),
        const SizedBox(height: 16),
        HomeViewLatestNewsBuilder(
          appCubit: appCubit,
          futureNews: futureNews,
        ),
        const SizedBox(height: 16),
        HomeViewMarketPricesTitleSection(
          title: S.of(context).marketPrices,
          appCubit: appCubit,
        ),
        const SizedBox(height: 16),
        HomeViewMarketPricesBuilder(
          appCubit: appCubit,
          future: futureProduct,
        )
      ],
    );
  }
}
