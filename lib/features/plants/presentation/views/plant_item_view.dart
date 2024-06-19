import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenoville_app/core/widgets/custom_app_bar.dart';
import 'package:greenoville_app/generated/l10n.dart';

import '../../data/plant_model.dart';

class PlantItemView extends StatelessWidget {
  const PlantItemView({
    super.key,
    required this.plantModel,
  });
  final PlantModel plantModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: S.of(context).plantInfo,
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
                  imageUrl: plantModel.plantImage,
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
                '${S.of(context).plantName}:',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                plantModel.plantName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).plantDescription}:',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                plantModel.plantDescription ??
                    S.of(context).noDescriptionAvailable,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${S.of(context).plantUsage}:',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                plantModel.plantUsage,
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
