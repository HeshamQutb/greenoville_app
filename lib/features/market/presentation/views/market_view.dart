import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/market/presentation/views/widgets/market_view_body.dart';
import 'package:greenoville_app/features/market/presentation/views/widgets/market_view_custom_app_bar.dart';
import '../../../../constants.dart';
import '../../data/market_farm_model.dart';
import '../view_model/market_cubit/market_cubit.dart';
import '../view_model/market_cubit/market_states.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  late Future<List<MarketFarmModel>> futureFarms;

  @override
  void initState() {
    super.initState();
    futureFarms = MarketCubit.get(context).getFarms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketCubit, MarketStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var marketCubit = MarketCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // AppBar
            const Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding,
              ),
              child: MarketViewCustomAppBar(),
            ),
            // Farm
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    futureFarms = marketCubit.getFarms();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      MarketViewBody(
                        futureFarms: futureFarms,
                        marketCubit: marketCubit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
