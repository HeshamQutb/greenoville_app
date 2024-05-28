import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AccountViewHeader extends StatelessWidget {
  const AccountViewHeader({
    super.key,
    required this.coverPictureUrl,
    required this.profilePictureUrl,
    required this.name,
    required this.isVerified,
    required this.bio,
  });

  final String coverPictureUrl;
  final String profilePictureUrl;
  final String name;
  final bool isVerified;
  final String bio;

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
                  image: CachedNetworkImageProvider(coverPictureUrl,),
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
                  backgroundImage:
                      CachedNetworkImageProvider(profilePictureUrl,),
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
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isVerified == true)
              const SizedBox(
                width: 5,
              ),
            if (isVerified == true)
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
            bio,
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
