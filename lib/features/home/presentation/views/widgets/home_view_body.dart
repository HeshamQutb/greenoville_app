import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_banner_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_custom_app_bar.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_location_and_weather_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_quick_action_section.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/news_feed_title_section.dart';

import '../../../../news_feed/presentation/views/news_feed_view.dart';
import 'market_prices_product_list_view.dart';
import 'home_view_news_feed_list_view.dart';
import 'market_prices_title_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeViewCustomAppBar(
              appCubit: appCubit,
            ),
            const SizedBox(height: 16),
            const HomeViewBannerSection(),
            const SizedBox(height: 16),
            const LocationAndWeatherSection(),
            const SizedBox(height: 16),
            HomeViewQuickActionSection(
              appCubit: appCubit,
            ),
            const SizedBox(height: 16),
            const NewsFeedTitleSection(
              title: 'Personalized News Feed',
              widget: NewsFeedView(),
            ),
            const SizedBox(height: 16),
            const HomeViewNewsFeedListView(),
            const SizedBox(height: 16),
            MarketPricesTitleSection(
              title: 'Market Prices',
              appCubit: appCubit,
            ),
            const SizedBox(height: 16),
            const MarketProductListView()
          ],
        );
      },
    );
  }
}
