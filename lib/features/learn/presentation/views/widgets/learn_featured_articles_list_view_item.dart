import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/utils/assets.dart';

import '../../../../../core/models/articles_model.dart';
import '../../../../../core/widgets/web_view.dart';

class LearnViewFeaturedArticlesViewItem extends StatelessWidget {
  const LearnViewFeaturedArticlesViewItem({
    super.key,
    required this.articlesModel,
  });
  final ArticlesModel articlesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return WebView(articlesModel.url);
            },
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: articlesModel.image,
                errorWidget: (context, url, error) {
                  if (error.toString().contains("Invalid image data")) {
                    return CachedNetworkImage(
                      imageUrl: AssetsData.noImage,
                      fit: BoxFit.fill,
                    );
                  } else {
                    return const Text('An error occurred. Please try again.');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articlesModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    articlesModel.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
