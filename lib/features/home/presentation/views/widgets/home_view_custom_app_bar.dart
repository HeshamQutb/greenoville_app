import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/profile/presentation/views/profile_view.dart';
import '../../../../../core/widgets/gradient_text.dart';

class HomeViewCustomAppBar extends StatelessWidget {
  const HomeViewCustomAppBar({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.grey,
          ),
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
        GestureDetector(
          onTap: () {
            navigateTo(context, const ProfileView());
          },
          child: const CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              AssetsData.testProfileImage,
            ), // Replace with the user's profile image
          ),
        ),
      ],
    );
  }
}
