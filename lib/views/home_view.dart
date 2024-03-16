import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Upper Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: getBanners(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Location & Weather
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.green),
                        SizedBox(width: 4),
                        Text('Luxor'),
                        SizedBox(width: 8),
                        Icon(Icons.wb_sunny, color: Colors.orangeAccent),
                        SizedBox(width: 4),
                        Text('Sunny'), // Replace with dynamic weather
                      ],
                    ),
                    SizedBox(height: 16),
                    // Quick Actions
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          QuickActionButton(
                              icon: Icons.lightbulb_outline,
                              label: 'Learn Tips'),
                          SizedBox(width: 8),
                          QuickActionButton(
                              icon: Icons.group, label: 'Join Forum'),
                          SizedBox(width: 8),
                          QuickActionButton(
                              icon: Icons.question_answer,
                              label: 'Ask Expert'),
                          SizedBox(width: 8),
                          QuickActionButton(
                              icon: Icons.shopping_cart,
                              label: 'Sell Produce'),
                        ],
                      ),
                    ),
                  ],
                ),
                // Middle Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personalized News Feed Section
                    SectionTitle(title: 'Personalized News Feed'),
                    NewsFeedCard(
                      title: 'New Farming Techniques',
                      content:
                      'Explore the latest sustainable farming methods.',
                      image:
                      'assets/images/agricultural-workers.jpg', // Placeholder image, replace with actual asset
                    ),
                    NewsFeedCard(
                      title: 'Weather Update',
                      content:
                      'Expect sunny days for the next week. Plan your farming activities accordingly.',
                      image:
                      'assets/images/agricultural-workers.jpg', // Placeholder image, replace with actual asset
                    ),

                    SizedBox(height: 16),

                    // Market Prices Section
                    SectionTitle(title: 'Market Prices'),
                    MarketPriceItem(crop: 'Tomatoes', price: '\$2.50 per kg'),
                    MarketPriceItem(crop: 'Apples', price: '\$1.80 per kg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getBanners() {
  return CarouselSlider(
    items: [
      'assets/images/agricultural1.jpg',
      'assets/images/agricultural2.jpg',
      'assets/images/agricultural3.jpg',
    ].map((imagePath) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
          height: 200,
        ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 200,
      initialPage: 0,
      enableInfiniteScroll: true,
      viewportFraction: 1,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal,
    ),
  );
}

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Implement action based on the button pressed
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'See all',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsFeedCard extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const NewsFeedCard({
    super.key,
    required this.title,
    required this.content,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 150, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketPriceItem extends StatelessWidget {
  final String crop;
  final String price;

  const MarketPriceItem({
    super.key,
    required this.crop,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(crop,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Price: $price'),
          ],
        ),
      ),
    );
  }
}
