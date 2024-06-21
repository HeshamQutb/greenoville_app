import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:greenoville_app/constants.dart';
import 'package:greenoville_app/core/services/navigate_services.dart';

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
      onTap: () {
        navigateTo(
          context,
          ToolItemView(
            toolModel: toolModel,
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: toolModel.toolImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      toolModel.toolName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
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
        ),
      ),
    );
  }
}
