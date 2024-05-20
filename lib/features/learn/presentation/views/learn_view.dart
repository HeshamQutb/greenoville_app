import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/learn/presentation/views/widgets/learn_view_custom_app_bar.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LearnViewCustomAppBar(),
          SizedBox(height: 20),
          CategoryTabs(),
          SizedBox(height: 30),
          Text(
            'Featured Articles and Tutorials',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          FeaturedContentList(),
          SizedBox(height: 30),
          Text(
            'Video Tutorials',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          VideoTutorialList(),
          SizedBox(height: 30),
          Text(
            'Expert Insights and Tips',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ExpertInsightList(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}


class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryTab(label: 'Soil Health'),
          CategoryTab(label: 'Organic Practices'),
          CategoryTab(label: 'Pest Control'),
          // Add more CategoryTab widgets for additional categories
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String label;

  const CategoryTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
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
          expertName: 'Expert 1',
          quote: 'Quote 1 from Expert 1',
          imagePath: 'https://via.placeholder.com/100',
          credentials: 'Credentials of Expert 1',
        ),
        SizedBox(height: 20),
        ExpertInsightItem(
          expertName: 'Expert 2',
          quote: 'Quote 2 from Expert 2',
          imagePath: 'https://via.placeholder.com/100',
          credentials: 'Credentials of Expert 2',
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
  final String credentials;

  const ExpertInsightItem({
    super.key,
    required this.expertName,
    required this.quote,
    required this.imagePath,
    required this.credentials,
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
            backgroundImage: NetworkImage(imagePath),
            radius: 30,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expertName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  quote,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  credentials,
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
