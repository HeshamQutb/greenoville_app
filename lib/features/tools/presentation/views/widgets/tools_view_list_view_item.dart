import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/services/navigate_services.dart';
import '../../../data/tool_model.dart';
import '../tool_item_view.dart';

class ToolsListViewItem extends StatelessWidget {
  const ToolsListViewItem({
    super.key,
    required this.toolModel,
  });

  final ToolModel toolModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(
          context,
          ToolItemView(
            toolModel: toolModel,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: toolModel.toolImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Text(
                    toolModel.toolName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(
                      context,
                      ToolItemView(
                        toolModel: toolModel,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
