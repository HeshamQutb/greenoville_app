import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_cubit.dart';
import 'package:greenoville_app/features/farm/presentation/view_model/farm_states.dart';
import 'package:greenoville_app/features/farm/presentation/views/widgets/farm_view_body_builder.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../create_farm/data/models/farm_model.dart';

class FarmView extends StatefulWidget {
  const FarmView({
    super.key,
    required this.uid,
    required this.showAppBar,
  });
  final String uid;
  final bool showAppBar;
  @override
  State<FarmView> createState() => _FarmViewState();
}

class _FarmViewState extends State<FarmView> {
  late Future<FarmModel?> futureFarm;
  @override
  @override
  void initState() {
    super.initState();
    futureFarm = FarmCubit.get(context).getFarm(uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FarmCubit, FarmStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var farmCubit = FarmCubit.get(context);
        return Scaffold(
          appBar: widget.showAppBar
              ? CustomAppBar(
                  centerTitle: true,
                  title: S.of(context).farm,
                  leadingAction: () {
                    Navigator.pop(context);
                  },
                )
              : null,
          body: FarmViewBodyBuilder(
            farmCubit: farmCubit,
            futureFarm: futureFarm,
          ),
        );
      },
    );
  }
}
