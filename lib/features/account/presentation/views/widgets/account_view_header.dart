import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import '../../../../auth/data/models/user_model.dart';

class AccountViewHeader extends StatelessWidget {
  const AccountViewHeader({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    userModel.coverImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 62,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: CachedNetworkImageProvider(
                    userModel.userImage,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userModel.userName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (userModel.isVerified == true)
              const SizedBox(
                width: 5,
              ),
            if (userModel.isVerified == true)
              const Icon(
                Icons.check_circle_sharp,
                color: Colors.blueAccent,
                size: 13,
              )
          ],
        ),
        const SizedBox(height: 8),
        const Divider(
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ExpandableText(
            userModel.bio,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            expandText: '',
            collapseOnTextTap: true,
            expandOnTextTap: true,
          ),
        ),
      ],
    );
  }
}
