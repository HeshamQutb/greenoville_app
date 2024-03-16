import 'package:flutter/material.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

class SoilView extends StatelessWidget {
  const SoilView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              navigateTo(context, const SoilExampleScreen());
            },
            child: SizedBox(
              height: 730,
              child: Image.asset(
                'assets/images/soil1.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SoilExampleScreen extends StatelessWidget {
  const SoilExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDFFB3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Image.asset(
                    'assets/images/soil example1.png',
                    fit: BoxFit.contain,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
