import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../view_model/featured_articles_cubit/featured_articles_cubit.dart';
import 'featured_articles_view_builder.dart';

class FeaturedArticlesViewBody extends StatelessWidget {
  const FeaturedArticlesViewBody({
    super.key,
    required this.latestNewsCubit,
  });

  final LatestNewsCubit latestNewsCubit;

  @override
  Widget build(BuildContext context) {
    return FeaturedArticlesBuilder(
      latestNewsCubit: latestNewsCubit,
    );
  }
}
