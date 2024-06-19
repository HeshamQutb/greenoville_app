import 'package:flutter/material.dart';

class EditPostLoadingSection extends StatelessWidget {
  const EditPostLoadingSection({super.key});

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