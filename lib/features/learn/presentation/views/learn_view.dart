import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/learn/presentation/views/widgets/learn_view_body.dart';
import 'package:greenoville_app/features/learn/presentation/views/widgets/learn_view_custom_app_bar.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_states.dart';
import '../../../../core/models/articles_model.dart';

class LearnView extends StatefulWidget {
  const LearnView({super.key});

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  late Future<List<ArticlesModel>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = AppCubit.get(context).getNews(
        dio: Dio(),
        url:
            'https://gnews.io/api/v4/search?country=eg&q=%D8%B7%D8%B1%D9%8A%D9%82%D8%A9%20%D8%B2%D8%B1%D8%A7%D8%B9%D8%A9&apikey=7ade9c8ce771581eb698a71ef64bb6f6');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LearnViewCustomAppBar(),
              Expanded(
                child: LearnViewBody(
                  appCubit: appCubit,
                  futureNews: futureNews,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FeaturedContentList extends StatelessWidget {
  const FeaturedContentList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return FeaturedContentItem(index: index);
        },
      ),
    );
  }
}

class FeaturedContentItem extends StatelessWidget {
  final int index;

  const FeaturedContentItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.network(
              'https://via.placeholder.com/300x200?text=Featured+Image+$index',
              fit: BoxFit.cover,
              width: 300,
              height: 200,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Title $index',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Description of the featured content $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoTutorialList extends StatelessWidget {
  const VideoTutorialList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return VideoTutorialItem(index: index);
        },
      ),
    );
  }
}

class VideoTutorialItem extends StatelessWidget {
  final int index;

  const VideoTutorialItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    'https://via.placeholder.com/150x100?text=Video+Thumbnail+$index'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Video Title $index',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Duration: 10:00',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpertInsightList extends StatelessWidget {
  const ExpertInsightList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpertInsightItem(
          expertName: 'Hesham Qutb',
          quote:
              'اعتمد على التنوع الحيوي في المزرعة: زراعة مجموعة متنوعة من المحاصيل والنباتات تساعد في الحفاظ على التربة وتقليل احتمالية الأمراض والآفات.',
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/unknown%20user.png?alt=media&token=74300a2b-f397-4a61-a79f-fd2c71d9a2ae',
        ),
        SizedBox(height: 20),
        ExpertInsightItem(
          expertName: 'م / مصطفى الصادق',
          quote:
              'نظرا لوجود الكثير من المشاكل المتعلقه بحضراتكم  ، اليكم بعض الخطوات الاساسيه لتجنب اى مشاكل مع النبات .١-اثناء تجهيز التربة التأكد من خلوها من المسببات المرضية.٢- التاكد من عدم وجود مستوى ماء أرضي مرتفع.٣- التاكدمن انخفاض نسبة ملوحة التربه٣- وضع سماد سوبر فوسفات مع الأسمدة العضوية أثناء تجهيز التربة.٤- فى  الأراضي الجديدة، يتم توزيع المقررات السمادية لأطول فترة ممكنة. ',
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/greenoville-8f9c1.appspot.com/o/profile_images%2FRhzTFVYF2kQWAKLIXj0DAAYXsu93?alt=media&token=251f2a09-2052-4d13-a7b7-83dc1791d82b',
        ),
        // Add more expert insights here
      ],
    );
  }
}

class ExpertInsightItem extends StatelessWidget {
  final String expertName;
  final String quote;
  final String imagePath;

  const ExpertInsightItem({
    super.key,
    required this.expertName,
    required this.quote,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(imagePath),
            radius: 30,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      expertName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.check_circle_sharp,
                      color: Colors.blueAccent,
                      size: 13,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  quote,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
