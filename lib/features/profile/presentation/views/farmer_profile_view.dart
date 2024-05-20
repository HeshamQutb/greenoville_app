import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';

class FarmerProfileView extends StatelessWidget {
  final String name;
  final String farmName;
  final String bio;
  final String location;
  final String contactNumber;
  final List<ProduceItem> produceItems;
  final List<Post> posts;

  const FarmerProfileView({
    super.key,
    required this.name,
    required this.farmName,
    required this.bio,
    required this.location,
    required this.contactNumber,
    required this.produceItems,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AssetsData.unknownUser),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  farmName,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(bio),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8),
                  Text(location),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(contactNumber),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
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
              const SizedBox(height: 16),
              const Text(
                'Posts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return posts[index];
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Follow'),
                ),
              ),
            ],
          ),
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

class Post extends StatelessWidget {
  final String title;
  final String content;

  const Post({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
