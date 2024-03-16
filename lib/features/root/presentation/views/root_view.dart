// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenoville_app/views/home_view.dart';
import 'package:greenoville_app/views/learn_view.dart';
import 'package:greenoville_app/views/market_view.dart';
import 'package:greenoville_app/views/profile_view.dart';
import 'package:greenoville_app/views/soil_view.dart';

import '../../../../views/community_view.dart';
import '../../../../core/widgets/chat_bot_fab.dart';


class RootView  extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SoilView(),
    const CommunityView(),
    const LearnView(),
    const MarketView(),
    const ProfileView()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GreeNoville',
          style: TextStyle(
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Colors.green, Colors.blue],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ), // Replace with the user's profile image
          ),
          const SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedFontSize: 11,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.seedling),
            label: 'Soil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[currentIndex],
      floatingActionButton: ChatBotFAB(
        onPressed: () {
          print('Chat bot button pressed');
        },
        iconPath: 'assets/images/chatbot.png', // Replace with your icon path
      ),
    );
  }
}


