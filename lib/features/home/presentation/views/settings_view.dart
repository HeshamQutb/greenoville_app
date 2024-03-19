import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/settings_view_body.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const SettingsViewBody(),
    );
  }
}
