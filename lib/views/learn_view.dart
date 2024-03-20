import 'package:flutter/material.dart';

class LearnView extends StatelessWidget {
  const LearnView({super.key});

  @override
  Widget build(BuildContext context) {
    // appBar: AppBar(
    //   title: Text(
    //     'Learn',
    //     style: TextStyle(
    //       foreground: Paint()
    //         ..shader = const LinearGradient(
    //           colors: [Colors.green, Colors.blue],
    //         ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
    //     ),
    //   ),
    //   actions: [
    //     IconButton(
    //       icon: const Icon(Icons.search),
    //       onPressed: () {
    //         // Handle search action
    //       },
    //     ),
    //   ],
    // ),
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Information Library'),
            SearchBar(),
            CategoryTabs(),
            SizedBox(height: 16),
            ArticleCard(
              title: 'Understanding Soil Health',
              category: 'Soil Management',
              imageUrl: 'assets/images/SOIL-HEALTH.jpg',
            ),
            ArticleCard(
              title: 'Organic Farming Practices',
              category: 'Organic Farming',
              imageUrl: 'assets/images/Organic-Farming.jpg',
            ),
            // Add more ArticleCard widgets for additional content

            SectionTitle(title: 'Case Studies'),
            CaseStudyCard(
              title: 'Successful Farm in California',
              imageUrl: 'assets/images/California.jpg',
            ),
            CaseStudyCard(
              title: 'Adapting to Climate Change',
              imageUrl: 'assets/images/adapt.jpg',
            ),
            // Add more CaseStudyCard widgets for additional content

            SectionTitle(title: 'Webinars & Live Sessions'),
            LiveSessionCard(
              title: 'Advanced Pest Control Techniques',
              date: 'Jan 25, 2024',
              imageUrl: 'assets/images/Advanced-Pest-Control.jpg',
            ),
            LiveSessionCard(
              title: 'Water Management Strategies',
              date: 'Feb 10, 2024',
              imageUrl: 'assets/images/water management.jpg',
            ),
            // Add more LiveSessionCard widgets for additional content
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search for articles, videos, tutorials...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
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

class AdvancedFilterOptions extends StatefulWidget {
  const AdvancedFilterOptions({super.key});

  @override
  State<AdvancedFilterOptions> createState() => _AdvancedFilterOptionsState();
}

class _AdvancedFilterOptionsState extends State<AdvancedFilterOptions> {
  String selectedRegion = 'All Regions';
  String selectedCropType = 'All Crop Types';
  String selectedExperienceLevel = 'All Experience Levels';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFilterDropdown(
          label: 'Filter by Region',
          items: ['All Regions', 'Region A', 'Region B', 'Region C'],
          onChanged: (value) {
            setState(() {
              selectedRegion = value as String;
            });
          },
          selectedValue: selectedRegion,
        ),
        buildFilterDropdown(
          label: 'Filter by Crop Type',
          items: ['All Crop Types', 'Crop A', 'Crop B', 'Crop C'],
          onChanged: (value) {
            setState(() {
              selectedCropType = value as String;
            });
          },
          selectedValue: selectedCropType,
        ),
        buildFilterDropdown(
          label: 'Filter by Experience Level',
          items: [
            'All Experience Levels',
            'Beginner',
            'Intermediate',
            'Advanced'
          ],
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value as String;
            });
          },
          selectedValue: selectedExperienceLevel,
        ),
      ],
    );
  }

  Widget buildFilterDropdown({
    required String label,
    required List<String> items,
    required Function onChanged,
    required String selectedValue,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 16),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged as void Function(String?)?,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.title,
    required this.category,
    required this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(category),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CaseStudyCard extends StatelessWidget {
  const CaseStudyCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LiveSessionCard extends StatelessWidget {
  const LiveSessionCard({
    super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  final String title;
  final String date;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
