// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/root/presentation/views/widgets/custom_bottom_nav_bar.dart';

import '../../../../core/widgets/chat_bot_fab.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            appCubit: appCubit,
          ),
          body: appCubit.screens[appCubit.currentIndex],
          floatingActionButton: ChatBotFAB(
            onPressed: () {
              print('Chat bot button pressed');
            },
            iconPath:
                'assets/images/chatbot.png', // Replace with your icon path
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
