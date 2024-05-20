import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';

class ExpertProfileView extends StatelessWidget {
  final String name;
  final String title;
  final String bio;
  final String email;
  final String phone;
  final List<String> expertise;
  final List<Post> posts;

  const ExpertProfileView({
    super.key,
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.phone,
    required this.expertise,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Profile'),
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
                  backgroundImage: AssetImage(AssetsData.unknownUser), // Replace with your image asset
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
                  title,
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
                  const Icon(Icons.email),
                  const SizedBox(width: 8),
                  Text(email),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 8),
                  Text(phone),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Expertise',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              for (var item in expertise) Text(item),
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
