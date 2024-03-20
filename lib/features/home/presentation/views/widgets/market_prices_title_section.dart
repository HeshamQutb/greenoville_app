import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';

class MarketPricesTitleSection extends StatelessWidget {
  const MarketPricesTitleSection(
      {super.key, required this.title, required this.appCubit});
  final String title;
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            appCubit.setPage(4);
          },
          child: const Text(
            'See all',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
