import 'package:flutter/material.dart';

class LocationAndWeatherSection extends StatelessWidget {
  const LocationAndWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.location_on, color: Colors.green),
        SizedBox(width: 4),
        Text('Luxor'),
        SizedBox(width: 8),
        Icon(Icons.wb_sunny, color: Colors.orangeAccent),
        SizedBox(width: 4),
        Text('Sunny'), // Replace with dynamic weather
      ],
    );
  }
}