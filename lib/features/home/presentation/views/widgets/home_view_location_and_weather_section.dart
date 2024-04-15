import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class LocationAndWeatherSection extends StatelessWidget {
  const LocationAndWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.green),
        const SizedBox(width: 4),
        Text(S.of(context).location,style: const TextStyle(fontSize: 16),),
        const SizedBox(width: 8),
        const Icon(Icons.wb_sunny, color: Colors.orangeAccent),
        const SizedBox(width: 4),
        Text(S.of(context).weather,style: const TextStyle(fontSize: 16),), // Replace with dynamic weather
      ],
    );
  }
}
