import 'package:flutter/material.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/gradient_text.dart';
import '../../../../../generated/l10n.dart';

class SoilsViewCustomAppBar extends StatelessWidget {
  const SoilsViewCustomAppBar({
    super.key,
    required this.appCubit,
    required this.soilSearchController,
  });
  final AppCubit appCubit;
  final TextEditingController soilSearchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientText(
          fontSize: 23,
          text: S.of(context).soilsTitle,
          colors: const [Colors.green, Colors.blue],
          left: 0.0,
          top: 0.0,
          width: 500.0,
          height: 70.0,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomTextField(
            maxLines: 1,
            onChanged: (value) {
              // appCubit.updateSearchQuery(value);
            },
            controller: soilSearchController,
            hintText: S.of(context).searchNow,
            suffixIcon: IconBroken.Search,
            validator: (String? value) {
              return value.toString();
            },
          ),
        )
      ],
    );
  }
}
