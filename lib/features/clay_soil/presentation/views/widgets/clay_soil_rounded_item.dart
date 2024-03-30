import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class ClaySoilRoundedItem extends StatelessWidget {
  const ClaySoilRoundedItem({
    super.key,
    required this.itemName,
    required this.itemImage,
  });
  final String itemName;
  final String itemImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcOver,
                ),
                image: AssetImage(
                  itemImage,
                ),
                fit: BoxFit.fill,
              ), // Or any other color you want
            ),
          ),
        ),
        Center(
          child: Text(
            itemName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: AssetsData.madimiOne,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}