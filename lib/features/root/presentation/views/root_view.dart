import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/core/utils/assets.dart';
import 'package:greenoville_app/features/chat_bot/presentation/views/chatbot_view.dart';
import 'package:greenoville_app/features/root/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:greenoville_app/features/root/presentation/views/widgets/drawer_body.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  Offset fabPosition = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        fabPosition = Offset(
          MediaQuery.of(context).size.width - 72, // 56 + 16 (padding)
          MediaQuery.of(context).size.height - 150,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData(context: context),
      child: BlocConsumer<AppCubit, AppStates>(
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
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: PageView(
                    controller: appCubit.pageController,
                    children: appCubit.screens,
                    onPageChanged: (index) {
                      appCubit.changeNavBar(index);
                    },
                  ),
                ),
                Positioned(
                  left: fabPosition.dx,
                  top: fabPosition.dy,
                  child: Draggable(

                    feedback: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        navigateTo(context, const ChatBotView());
                      },
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: Image.asset(AssetsData.chatBotIcon,),
                    ),
                    childWhenDragging: Container(),
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        navigateTo(context, const ChatBotView());
                      },
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: Image.asset(AssetsData.chatBotIcon,),
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        // Only update the vertical position (dy)
                        double newY = details.offset.dy;

                        // Ensure the FAB stays within the screen boundaries vertically
                        final screenHeight = MediaQuery.of(context).size.height;
                        if (newY < 0) newY = 0;
                        if (newY > screenHeight - 56 - 80) newY = screenHeight - 56 - 80; // 56 is FAB size, 80 is for bottom navigation bar

                        // Snap to the closest side (left or right) with padding
                        final screenWidth = MediaQuery.of(context).size.width;
                        double newX = details.offset.dx;
                        if (newX < screenWidth / 2) {
                          newX = 16; // Snap to the left side with padding
                        } else {
                          newX = screenWidth - 56 - 16; // Snap to the right side with padding
                        }

                        fabPosition = Offset(newX, newY);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
