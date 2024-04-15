import 'package:flutter/material.dart';

class SoilsViewBodyListViewItem extends StatelessWidget {
  const SoilsViewBodyListViewItem({
    super.key,
    required this.soilImage,
    required this.soilName,
    required this.imageRight,
  });
  final String soilImage;
  final String soilName;
  final bool imageRight;
  @override
  Widget build(BuildContext context) {
    return imageRight
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(soilImage),
                      radius: 60,
                    ),
                    const Spacer(),
                    Text(
                      soilName,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      soilName,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage(soilImage),
                      radius: 65,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
