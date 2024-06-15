import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/utils/icon_broken.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_post/presentation/views/add_post_view.dart';

class CommunityViewCustomAppBar extends StatelessWidget {
  const CommunityViewCustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18),
      child: Row(
        children: [
          GradientText(
            fontSize: 23,
            text: S.of(context).communityTitle,
            colors: const [Colors.green, Colors.blue],
            left: 0.0,
            top: 0.0,
            width: 500.0,
            height: 70.0,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPostView(),
                ),
              );
              if (result == true) {
                // Refresh posts if a new post was added
                (context as Element).markNeedsBuild();
              }
            },
            child: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    IconBroken.Edit_Square,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    S.of(context).post,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
