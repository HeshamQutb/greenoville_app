import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/features/latest_news/presentation/view_model/latest_news_cubit/latest_news_cubit.dart';
import 'latest_news_view_builder.dart';

class LatestNewsViewBody extends StatelessWidget {
  const LatestNewsViewBody({
    super.key,
    required this.category,
    required this.latestNewsCubit,
  });
  final String category;
  final LatestNewsCubit latestNewsCubit;

  @override
  Widget build(BuildContext context) {
    return LatestNewsViewBuilder(
      category: category,
      latestNewsCubit: latestNewsCubit,
    );
  }
}
