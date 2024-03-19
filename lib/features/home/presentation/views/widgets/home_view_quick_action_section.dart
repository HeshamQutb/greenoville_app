import 'package:flutter/material.dart';
import 'package:greenoville_app/features/home/presentation/views/widgets/quick_action_button.dart';

class HomeViewQuickActionSection extends StatelessWidget {
  const HomeViewQuickActionSection({super.key});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          QuickActionButton(
            icon: Icons.lightbulb_outline,
            label: 'Learn Tips', onPressed: () {},
          ),
          const SizedBox(width: 8),
          QuickActionButton(
            icon: Icons.question_answer,
            label: 'Ask Expert', onPressed: () {},
          ),
          const SizedBox(width: 8),
          QuickActionButton(
            icon: Icons.shopping_cart,
            label: 'Sell Produce', onPressed: () {  },
          ),
        ],
      ),
    );
  }
}
