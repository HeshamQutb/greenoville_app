import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';

import '../../../../../core/widgets/default_button.dart';
import 'darwer_item.dart';
import 'drawer_header.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DrawerHeaderSection(),
        const SizedBox(
          height: 30,
        ),
        DrawerItem(
          leadingIcon: Icons.person_2_outlined,
          title: 'Profile',
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.location_on_outlined,
          title: 'My Address',
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.visibility_outlined,
          title: 'Appearance',
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.lock_outline_rounded,
          title: 'Privacy & Security',
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.headphones_outlined,
          title: 'Help & Support',
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.info_outline_rounded,
          title: 'About',
          onTap: () {},
        ),
        const Expanded(
          child: SizedBox(
            height: 16,
          ),
        ),
        DefaultButton(
          onPressed: () {
            appCubit.signOut(context);
          },
          text: 'Sign Out',
        )
      ],
    );
  }
}
