import 'package:flutter/material.dart';

class PostComments extends StatelessWidget {
  const PostComments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: 10,
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
    );
  }
}
