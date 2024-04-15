import 'package:flutter/material.dart';
import 'package:greenoville_app/features/tools/presentation/views/widgets/tools_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class ToolsView extends StatelessWidget {
  const ToolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).tools,
        leadingAction: () {
          Navigator.pop(context);
        },
      ),
      body: const ToolsViewBody(),
    );
  }
}
