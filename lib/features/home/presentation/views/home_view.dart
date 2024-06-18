import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/core/models/articles_model.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:greenoville_app/features/market_prices/data/product_model.dart';

import '../../../../constants.dart';
import '../../../auth/data/models/user_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<UserModel> futureUser;
  late Future<List<ArticlesModel>> futureNews;
  late Future<List<ProductModel>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureUser = AppCubit.get(context).getUserData(context: context);
    futureNews = AppCubit.get(context).getNews(dio: Dio());
    futureProduct = AppCubit.get(context).getAllProducts();
  }

  Future<void> refreshHome() async {
    setState(() {
      futureNews = AppCubit.get(context).getNews(dio: Dio());
      futureProduct = AppCubit.get(context).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return RefreshIndicator(
          onRefresh: refreshHome,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: HomeViewBody(
                appCubit: appCubit,
                futureUser: futureUser,
                futureNews: futureNews,
                futureProduct: futureProduct,
              ),
            ),
          ),
        );
      },
    );
  }
}
