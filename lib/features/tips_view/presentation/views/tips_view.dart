import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/tips_view/data/models/tips_model.dart';
import 'package:greenoville_app/features/tips_view/presentation/views/widgets/tips_view_body.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_model/tips_cubit/tips_cubit.dart';
import '../view_model/tips_cubit/tips_states.dart';

class TipsView extends StatefulWidget {
  const TipsView({
    super.key,
    this.uid,
    required this.showAppBar,
  });
  final String? uid;
  final bool showAppBar;
  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  late Future<List<TipsModel>> future;

  @override
  void initState() {
    super.initState();
    future = widget.uid != null
        ? TipsCubit.get(context).geTips(uid: widget.uid)
        : TipsCubit.get(context).geTips();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipsCubit, TipsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tipsCubit = TipsCubit.get(context);
        return Scaffold(
          appBar: widget.showAppBar
              ? CustomAppBar(
                  centerTitle: true,
                  title: S.of(context).tips,
                  leadingAction: () {
                    Navigator.pop(context);
                  },
                )
              : null,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      TipsViewBody(
                        tipsCubit: tipsCubit,
                        future: future,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
