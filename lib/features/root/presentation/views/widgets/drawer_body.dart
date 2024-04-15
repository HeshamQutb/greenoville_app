import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/appearance/presentation/views/appearance_view.dart';
import 'package:greenoville_app/features/language/presentation/views/language_view.dart';
import 'package:greenoville_app/features/profile/presentation/views/profile_view.dart';

import '../../../../../core/services/sign_out.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../generated/l10n.dart';
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
          title: S.of(context).profile,
          onTap: () {
            Navigator.pop(context);
            navigateTo(context, const ProfileView());
          },
        ),
        DrawerItem(
          leadingIcon: Icons.location_on_outlined,
          title: S.of(context).myAddress,
          onTap: () {

          },
        ),
        DrawerItem(
          leadingIcon: Icons.visibility_outlined,
          title: S.of(context).appearance,
          onTap: () {
            Navigator.pop(context);
            navigateTo(context, const AppearanceView());
          },
        ),
        DrawerItem(
          leadingIcon: Icons.language,
          title: S.of(context).language,
          onTap: () {
            Navigator.pop(context);
            navigateTo(context,  const LanguageView());
          },
        ),
        DrawerItem(
          leadingIcon: Icons.lock_outline_rounded,
          title: S.of(context).privacySecurity,
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.headphones_outlined,
          title: S.of(context).helpSupport,
          onTap: () {},
        ),
        DrawerItem(
          leadingIcon: Icons.info_outline_rounded,
          title: S.of(context).about,
          onTap: () {},
        ),
        const Expanded(
          child: SizedBox(
            height: 16,
          ),
        ),
        DefaultButton(
          onPressed: () {
            signOut(context);
          },
          text: S.of(context).signOut,
        )
      ],
    );
  }
}
