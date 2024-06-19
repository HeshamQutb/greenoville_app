import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tools/presentation/views/widgets/tools_view_list_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/tool_model.dart';
import '../../view_model/tools_cubit/tools_cubit.dart';

class ToolsViewBuilder extends StatelessWidget {
  const ToolsViewBuilder({
    super.key,
    required this.toolsCubit,
    required this.future,
  });
  final ToolsCubit toolsCubit;
  final Future<List<ToolModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToolModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                '${S.of(context).error}: ${snapshot.error}',
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                S.of(context).noTools,
              ),
            ),
          );
        } else {
          return ToolsListView(
            tools: snapshot.data!,
          );
        }
      },
    );
  }
}
