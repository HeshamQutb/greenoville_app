import 'package:flutter/material.dart';

class AddPostLoadingSection extends StatelessWidget {
  const AddPostLoadingSection({super.key});

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