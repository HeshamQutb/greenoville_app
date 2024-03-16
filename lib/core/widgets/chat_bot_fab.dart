import 'package:flutter/material.dart';

class ChatBotFAB extends StatefulWidget {
  final Function onPressed;
  final String iconPath;

  const ChatBotFAB({super.key, required this.onPressed, required this.iconPath});

  @override
  State<ChatBotFAB> createState() => _ChatBotFABState();
}

class _ChatBotFABState extends State<ChatBotFAB> {
  final bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,

      ),
      child: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   _isExpanded = !_isExpanded;
          // });
          // widget.onPressed();
        },
        child: AnimatedCrossFade(
          firstChild: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
          secondChild: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                // Replace with your chat icon
                Icons.chat,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text(
                'Chat Now',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
