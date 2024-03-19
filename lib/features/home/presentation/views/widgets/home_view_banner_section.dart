import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeViewBannerSection extends StatelessWidget {
  const HomeViewBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        'assets/images/agricultural1.jpg',
        'assets/images/agricultural2.jpg',
        'assets/images/agricultural3.jpg',
      ].map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
            height: 180,
            width: double.infinity,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}