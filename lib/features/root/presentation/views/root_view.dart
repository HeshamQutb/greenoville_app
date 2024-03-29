// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/root/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:greenoville_app/features/root/presentation/views/widgets/drawer_body.dart';
import '../../../../core/widgets/chat_bot_fab.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Scaffold(
          drawer: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: DrawerBody(
                  appCubit: appCubit,
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            appCubit: appCubit,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: PageView(
              controller: appCubit.pageController,
              children: appCubit.screens,
              onPageChanged: (index) {
                appCubit.changeNavBar(index);
              },
            ),
          ),
          floatingActionButton: ChatBotFAB(
            onPressed: () {
              print('Chat bot button pressed');
            },
            iconPath:
                'assets/images/chatbot.png', // Replace with your icon path
          ),
        );
      },
    );
  }
}
