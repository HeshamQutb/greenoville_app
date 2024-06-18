import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/market_prices_cubit/market_prices_cubit.dart';
import 'widgets/market_prices_view_body.dart';

class MarketPricesView extends StatefulWidget {
  const MarketPricesView({super.key});

  @override
  State<MarketPricesView> createState() => _MarketPricesViewState();
}

class _MarketPricesViewState extends State<MarketPricesView> {
  late Future<List<ProductModel>> future;
  @override
  void initState() {
    super.initState();
    future = MarketPricesCubit.get(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketPricesCubit(),
      child: BlocConsumer<MarketPricesCubit, MarketPricesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var marketPricesCubit = MarketPricesCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).marketPrices,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  MarketPricesViewBody(
                    marketPricesCubit: marketPricesCubit,
                    future: future,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
