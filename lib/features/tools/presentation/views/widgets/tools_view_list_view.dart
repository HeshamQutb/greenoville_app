import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tools/presentation/views/widgets/tools_view_list_view_item.dart';
import '../../../data/tool_model.dart';

class ToolsListView extends StatelessWidget {
  const ToolsListView({
    super.key,
    required this.tools,
  });
  final List<ToolModel> tools;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: tools.length,
        (context, index) {
          return ToolsListViewItem(
            toolModel: tools[index],
          );
        },
      ),
    );
  }
}
