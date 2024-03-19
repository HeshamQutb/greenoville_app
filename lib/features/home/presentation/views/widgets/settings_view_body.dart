import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/widgets/default_button.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/settings_view_list_view_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          SettingsViewItem(
            leadingIcon: Icons.person_2_outlined,
            title: 'Account',
            trailing: () {},
          ),
          const Divider(),
          SettingsViewItem(
            leadingIcon: Icons.visibility_outlined,
            title: 'Appearance',
            trailing: () {},
          ),
          const Divider(),
          SettingsViewItem(
            leadingIcon: Icons.lock_outline_rounded,
            title: 'Privacy & Security',
            trailing: () {},
          ),
          const Divider(),
          SettingsViewItem(
            leadingIcon: Icons.headphones_outlined,
            title: 'Help & Support',
            trailing: () {},
          ),
          const Divider(),
          SettingsViewItem(
            leadingIcon: Icons.info_outline_rounded,
            title: 'About',
            trailing: () {},
          ),
          const Expanded(
            child: SizedBox(
              height: 16,
            ),
          ),
          const DefaultButton(text: 'Sign Out')
        ],
      ),
    );
  }
}
