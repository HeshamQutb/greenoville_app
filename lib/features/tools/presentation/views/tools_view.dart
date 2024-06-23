import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/tool_model.dart';
import '../view_model/tools_cubit/tools_cubit.dart';
import 'widgets/tools_view_body.dart';

class ToolsView extends StatefulWidget {
  const ToolsView({
    super.key,
    required this.soilType,
  });
  final String soilType;

  @override
  State<ToolsView> createState() => _ToolsViewState();
}

class _ToolsViewState extends State<ToolsView> {
  late Future<List<ToolModel>> future;
  @override
  void initState() {
    super.initState();
    future = ToolsCubit.get(context).getTools(
      soilType: 'loam',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToolsCubit(),
      child: BlocConsumer<ToolsCubit, ToolsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var toolsCubit = ToolsCubit.get(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: S.of(context).tools,
              leadingAction: () {
                Navigator.pop(context);
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: CustomScrollView(
                slivers: [
                  ToolsViewBody(
                    toolsCubit: toolsCubit,
                    future: future,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
