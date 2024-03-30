import 'package:flutter/material.dart';
import 'package:greenoville_app/features/sandy_soil/presentation/views/widgets/sandy_soil_rounded_item.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/utils/assets.dart';

class SandySoilViewBody extends StatelessWidget {
  const SandySoilViewBody({super.key, required this.items});
  final List<Map<String, dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Sandy Soil',
          style: TextStyle(
            fontFamily: AssetsData.madimiOne,
            fontSize: 50,
            height: 1.2,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage(
                AssetsData.sandy,
              ),
              fit: BoxFit.fill,
            ), // Or any other color you want
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
          children: List.generate(
            4,
            (index) => GestureDetector(
              onTap: () {
                navigateTo(context, items[index]['screen']);
              },
              child: SandySoilRoundedItem(
                itemName: items[index]['itemName'],
                itemImage: items[index]['itemImage'],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
