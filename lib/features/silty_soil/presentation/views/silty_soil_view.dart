import 'package:flutter/material.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/features/sandy_soil/presentation/view_model/sandy_soil_list_items.dart';
import 'package:greenoville_app/features/silty_soil/presentation/views/widgets/silty_soil_view_body.dart';

class SiltySoilView extends StatelessWidget {
  const SiltySoilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor, // Assuming kPrimaryColor is defined somewhere
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SiltySoilViewBody(
          items: sandySoilListItems,
        ),
      ),
    );
  }
}




