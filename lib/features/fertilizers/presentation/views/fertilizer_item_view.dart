import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/generated/l10n.dart';

import '../../data/fertilizer_model.dart';

class FertilizerItemView extends StatelessWidget {
  const FertilizerItemView({
    super.key,
    required this.fertilizerModel,
  });
  final FertilizerModel fertilizerModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: S.of(context).fertilizerInfo,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: fertilizerModel.fertilizerImage,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).fertilizerName}:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                fertilizerModel.fertilizerName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).fertilizerDescription}:',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                fertilizerModel.fertilizerDescription ??
                    S.of(context).noDescriptionAvailable,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).fertilizerUsage}:',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                fertilizerModel.fertilizerUsage,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
