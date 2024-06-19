import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/tool_model.dart';
import '../../view_model/tools_cubit/tools_cubit.dart';
import 'tools_view_builder.dart';

class ToolsViewBody extends StatelessWidget {
  const ToolsViewBody({
    super.key,
    required this.toolsCubit,
    required this.future,
  });
  final Future<List<ToolModel>> future;
  final ToolsCubit toolsCubit;

  @override
  Widget build(BuildContext context) {
    return ToolsViewBuilder(
      toolsCubit: toolsCubit,
      future: future,
    );
  }
}
