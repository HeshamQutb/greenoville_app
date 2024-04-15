import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class PostImageSection extends StatelessWidget {
  const PostImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          image: const DecorationImage(
            image: CachedNetworkImageProvider(AssetsData.testPostImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}