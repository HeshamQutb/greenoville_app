import 'package:flutter/material.dart';

class NewsErrorWidget extends StatelessWidget {
  const NewsErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.deepOrangeAccent,
          size: 35,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Oops There Was an Error!',
          style: TextStyle(fontSize: 23),
        ),
      ],
    );
  }
}