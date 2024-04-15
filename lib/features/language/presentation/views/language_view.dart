import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/core/app_cubit/app_cubit.dart';
import 'package:greenoville_app/core/app_cubit/app_states.dart';
import 'package:greenoville_app/features/language/presentation/views/widgets/language_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(builder: (context,state){
      var appCubit = AppCubit.get(context);
      return Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).language,
          leadingAction: () {
            Navigator.pop(context);
          },
        ),
        body:  LanguageViewBody(appCubit: appCubit,),
      );
    });
  }
}
