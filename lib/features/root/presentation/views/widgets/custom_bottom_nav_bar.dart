import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greenoville_app/core/utils/assets.dart';

import '../../../../../core/app_cubit/app_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.appCubit});
  final AppCubit appCubit;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: appCubit.isArabic()
          ? const TextStyle(
              fontFamily: AssetsData.arefRuqaaFont,
              fontWeight: FontWeight.bold,
            )
          : null,
      unselectedLabelStyle: appCubit.isArabic()
          ? const TextStyle(fontFamily: AssetsData.arefRuqaaFont)
          : null,
      selectedFontSize: appCubit.isArabic() ? 16 : 13,
      unselectedFontSize: appCubit.isArabic() ? 14 : 12,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.green,
      currentIndex: appCubit.currentIndex,
      onTap: (index) {
        appCubit.setPage(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_filled),
          label: appCubit.isArabic() ? 'الرئيسية' : 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.seedling),
          label: appCubit.isArabic() ? 'التربة' : 'Soil',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.connect_without_contact),
          label: appCubit.isArabic() ? 'المجتمع' : 'Community',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.library_books),
          label: appCubit.isArabic() ? 'التعلم' : 'Learn',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_basket),
          label: appCubit.isArabic() ? 'السوق' : 'Market',
        ),
      ],
    );
  }
}
