import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../../../core/utils/assets.dart';
import 'soil_type_rounded_item.dart';

class SoilTypeViewBody extends StatelessWidget {
  const SoilTypeViewBody({
    super.key,
    required this.items,
    required this.soilTypeName,
    required this.soilTypeImage,
    required this.appCubit,
  });
  final List<Map<String, dynamic>> items;
  final String soilTypeName;
  final String soilTypeImage;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          soilTypeName,
          style: TextStyle(
            fontFamily: appCubit.isArabic()
                ? AssetsData.almaraiFont
                : AssetsData.madimiOne,
            fontSize: 50,
            // height: 1.2,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(
                soilTypeImage,
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
              child: SoilTypeRoundedItem(
                itemName: items[index]['itemName'],
                itemImage: items[index]['itemImage'],
                appCubit: appCubit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
