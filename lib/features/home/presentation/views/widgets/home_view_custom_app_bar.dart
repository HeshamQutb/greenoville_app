import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../../account/presentation/views/account_view.dart';

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
              AccountView(
                appCubit: appCubit,
              ),
            );
          },
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              kUserModel!.userImage,
            ),
          ),
        ),
      ],
    );
  }
}
