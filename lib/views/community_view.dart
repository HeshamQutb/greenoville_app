import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 810,
            child: Image.asset('assets/images/community1.png',fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
}
