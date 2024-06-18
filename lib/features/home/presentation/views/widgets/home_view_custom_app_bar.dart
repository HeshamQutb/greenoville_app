import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import 'package:greenoville_app/features/auth/data/models/user_model.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../../account/presentation/views/account_view.dart';
import '../../../../chat/presentation/views/chat_users_view.dart';

class HomeViewCustomAppBar extends StatelessWidget {
  const HomeViewCustomAppBar({
    super.key,
    required this.appCubit,
    required this.futureUser,
  });
  final AppCubit appCubit;

  final Future<UserModel> futureUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              GradientText(
                fontSize: 23,
                text: S.of(context).appName,
                colors: const [Colors.green, Colors.blue],
                left: 0.0,
                top: 0.0,
                width: 500.0,
                height: 70.0,
              ),
              const Spacer(),
              const Icon(
                IconBroken.Notification,
                size: 40,
                color: Colors.grey,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              GradientText(
                fontSize: 23,
                text: S.of(context).appName,
                colors: const [Colors.green, Colors.blue],
                left: 0.0,
                top: 0.0,
                width: 500.0,
                height: 70.0,
              ),
              const Spacer(),
              const Icon(
                IconBroken.Notification,
                size: 40,
                color: Colors.grey,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              GradientText(
                fontSize: 23,
                text: S.of(context).appName,
                colors: const [Colors.green, Colors.blue],
                left: 0.0,
                top: 0.0,
                width: 500.0,
                height: 70.0,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  navigateTo(
                    context,
                    const ChatUsersScreen(),
                  );
                },
                child: const Icon(
                  IconBroken.Notification,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(
                    context,
                    const AccountView(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      snapshot.data!.userImage,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
