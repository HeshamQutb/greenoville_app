import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/home/presentation/views/settings_view.dart';

import '../../../../../core/widgets/gradient_text.dart';

class HomeViewCustomAppBar extends StatelessWidget {
  const HomeViewCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu,size: 30,color: Colors.grey,),
        ),
        const GradientText(
          fontSize: 23,
          text: 'GreeNoville',
          colors: [Colors.green, Colors.blue],
          left: 0.0,
          top: 0.0,
          width: 300.0,
          height: 70.0,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            navigateTo(context, const SettingsView());
          },
        ),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ), // Replace with the user's profile image
          ),
        ),
      ],
    );
  }
}
