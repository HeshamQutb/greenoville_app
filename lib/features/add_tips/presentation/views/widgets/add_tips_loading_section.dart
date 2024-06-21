import 'package:flutter/material.dart';

class AddTipsLoadingSection extends StatelessWidget {
  const AddTipsLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LinearProgressIndicator(),
        SizedBox(height: 10),
      ],
    );
  }
}