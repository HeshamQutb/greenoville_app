import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/default_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Banner
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/hero-banner.jpeg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  radius: 62,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
              ],
            ),
            // User Profile
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Hesham Qutb', // Replace with actual username
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Quick Stats Panel
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuickStatItem(
                            label: 'Farm Size',
                            value: '50 acres'), // Replace with actual data
                        SizedBox(
                          width: 20,
                        ),
                        QuickStatItem(
                            label: 'Harvest Yields',
                            value: '1200 kg'), // Replace with actual data
                        SizedBox(
                          width: 20,
                        ),
                        QuickStatItem(
                            label: 'Sustainability Score',
                            value: '95'), // Replace with actual data
                        SizedBox(
                          width: 20,
                        ),
                        QuickStatItem(
                            label: 'Followers',
                            value: '1200'), // Replace with actual data
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Progress Bar
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  const SizedBox(height: 16),
                  aboutMeBioSection(),
                  // Achievements Showcase
                  achievementsShowcaseSection(),
                  // Edit Profile Button
                  DefaultButton(onPressed: () {}, text: 'Edit Profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickStatItem extends StatelessWidget {
  final String label;
  final String value;

  const QuickStatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        const Divider(
          height: 8, // Adjusted height
          thickness: 3,
          color: Colors.grey,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// Connections Section
Widget connectionsSection() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Connections',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(
              'assets/images/profile.png'), // Replace with actual images
        ),
        title: Text('Jane Doe'), // Replace with actual names
        subtitle: Text('Friend since 2020'), // Additional details
        // Implement more ListTiles as needed
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(
              'assets/images/profile.png'), // Replace with actual images
        ),
        title: Text('Bob Smith'), // Replace with actual names
        subtitle: Text('Colleague'), // Additional details
        // Implement more ListTiles as needed
      ),
    ],
  );
}

// Social Links
Widget socialLinksSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Social Links',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // Implement your social links UI here
      Row(
        children: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.facebook),
            onPressed: () {
              // Implement social media link action
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.twitter),
            onPressed: () {
              // Implement social media link action
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            onPressed: () {
              // Implement social media link action
            },
          ),
        ],
      ),
    ],
  );
}

// About Me Bio
Widget aboutMeBioSection() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'About Me',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Text(
        'Passionate farmer exploring sustainable farming practices. '
        'Join me on this journey towards a greener future.',
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

// Achievements Showcase
Widget achievementsShowcaseSection() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Achievements Showcase',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // Implement your achievements showcase UI here
      // You can use a GridView or other widgets to display badges
    ],
  );
}

// Edit Profile Button
Widget editProfileButton() {
  return ElevatedButton(
    onPressed: () {
      // Implement action to navigate to the edit profile screen
    },
    child: const Text('Edit Profile'),
  );
}
