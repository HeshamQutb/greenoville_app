import 'package:flutter/material.dart';


class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  @override
  Widget build(BuildContext context) {
    return
      // appBar: AppBar(
      //   title: Text(
      //     'Market',
      //     style: TextStyle(
      //       foreground: Paint()
      //         ..shader = const LinearGradient(
      //           colors: [Colors.green, Colors.blue],
      //         ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.filter_list),
      //       onPressed: () {
      //         // Implement filtering action
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.sort),
      //       onPressed: () {
      //         // Implement sorting action
      //       },
      //     ),
      //   ],
      // ),
      const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchBar()
            ),
            // Farm List
            FarmCard(
              farmName: 'Green Acres Farm',
              farmerName: 'Hassan Ali', // Real example name
              distance: '2.5 km',
              contactNumber: '+1 123-456-7890', // Real example number
              produceItems: [
                ProduceItem(
                  name: 'Tomatoes',
                  price: '\$2.50/kg',
                  image: 'assets/images/Tomato.png',
                ),
                ProduceItem(
                  name: 'Apples',
                  price: '\$2.80/kg',
                  image: 'assets/images/apples.png',
                ),
                ProduceItem(
                  name: 'Carrots',
                  price: '\$4.00/kg',
                  image: 'assets/images/Carrots.png',
                ),
                ProduceItem(
                  name: 'Onion',
                  price: '\$1.50/kg',
                  image: 'assets/images/onion.png',
                ),
                // Add more produce items as needed
              ],
            ),
            FarmCard(
              farmName: 'Green Acres Farm',
              farmerName: 'John Doe', // Real example name
              distance: '2.5 km',
              contactNumber: '+1 123-456-7890', // Real example number
              produceItems: [
                ProduceItem(
                  name: 'Tomatoes',
                  price: '\$2.50/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                ProduceItem(
                  name: 'Apples',
                  price: '\$1.80/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                // Add more produce items as needed
              ],
            ),
            FarmCard(
              farmName: 'Green Acres Farm',
              farmerName: 'John Doe', // Real example name
              distance: '2.5 km',
              contactNumber: '+1 123-456-7890', // Real example number
              produceItems: [
                ProduceItem(
                  name: 'Tomatoes',
                  price: '\$2.50/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                ProduceItem(
                  name: 'Apples',
                  price: '\$1.80/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                ProduceItem(
                  name: 'Tomatoes',
                  price: '\$2.50/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                ProduceItem(
                  name: 'Apples',
                  price: '\$1.80/kg',
                  image: 'assets/images/SOIL-HEALTH.jpg',
                ),
                // Add more produce items as needed
              ],
            )
          ],
        ),
      );
  }
}

class FarmCard extends StatelessWidget {
  final String farmName;
  final String farmerName;
  final String distance;
  final String contactNumber;
  final List<ProduceItem> produceItems;

  const FarmCard({super.key,
    required this.farmName,
    required this.farmerName,
    required this.distance,
    required this.contactNumber,
    required this.produceItems,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Farm Information
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/farmer.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          farmName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('By $farmerName'),
                        Text(distance),
                      ],
                    ),
                  ],
                ),
                // Contact Button
                ElevatedButton(
                  onPressed: () {
                    // Implement contact farm action
                  },
                  child: Text('Contact $farmerName',style: const TextStyle(color: Colors.green),),
                ),
              ],
            ),
          ),
          // Produce Preview
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: produceItems.length,
            itemBuilder: (context, index) {
              return produceItems[index];
            },
          ),
          // See More Button
          TextButton(
            onPressed: () {
              // Implement see more action
            },
            child: const Text('See More',style: TextStyle(color: Colors.green),),
          ),
        ],
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
          hintText: 'Search by produce type, farm name, or location',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class ProduceItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProduceItem({super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            height: 80,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
