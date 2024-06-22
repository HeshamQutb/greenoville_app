import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/features/learn/presentation/views/widgets/title_section.dart';
import 'package:greenoville_app/features/tips_view/presentation/views/tips_view.dart';
import '../../../../../core/models/articles_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../../featured_articles/presentation/views/featured_articles_view.dart';
import '../learn_view.dart';
import 'learn_featured_articles_builder.dart';

class LearnViewBody extends StatelessWidget {
  const LearnViewBody({
    super.key,
    required this.appCubit,
    required this.futureNews,
  });
  final AppCubit appCubit;
  final Future<List<ArticlesModel>> futureNews;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          TitleSection(
            title: S.of(context).featuredArticles,
            widget: const FeaturedArticlesView(),
            appCubit: appCubit,
          ),
          const SizedBox(height: 20),
          LearnViewFeaturedArticlesBuilder(
            appCubit: appCubit,
            futureNews: futureNews,
          ),
          const SizedBox(height: 30),
          TitleSection(
            title: S.of(context).videoTutorials,
            widget: const FeaturedArticlesView(),
            appCubit: appCubit,
          ),
          const SizedBox(height: 20),
          const VideoTutorialList(),
          const SizedBox(height: 30),
          TitleSection(
            title: S.of(context).expertInsights,
            widget: const TipsView(showAppBar: true),
            appCubit: appCubit,
          ),
          const SizedBox(height: 20),
          const ExpertInsightList(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
