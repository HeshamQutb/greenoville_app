import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/models/articles_model.dart';
import '../../../../../core/widgets/news_error_widget.dart';
import '../../../../../generated/l10n.dart';
import 'home_view_latest_news_list_view.dart';

class HomeViewLatestNewsBuilder extends StatelessWidget {
  const HomeViewLatestNewsBuilder({
    super.key,
    required this.appCubit,
    required this.futureNews,
  });
  final AppCubit appCubit;
  final Future<List<ArticlesModel>> futureNews;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: NewsErrorWidget(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                S.of(context).noNewsAvailable,
              ),
            ),
          );
        } else {
          return HomeViewLatestNewsListView(
            articles: snapshot.data!,
          );
        }
      },
    );
  }
}
