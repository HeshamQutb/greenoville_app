import 'package:flutter/material.dart';
import 'package:greenoville_app/generated/l10n.dart';

class QuantitySection extends StatelessWidget {
  const QuantitySection({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });
  final int quantity;
  final Function(int) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Text('${S.of(context).quantity}: $quantity'),
    //     const SizedBox(width: 10),
    //     Row(
    //       children: [
    //         IconButton(
    //           onPressed: () {
    //             if (quantity > 1) onQuantityChanged(quantity - 1);
    //           },
    //           icon: const Icon(Icons.remove_circle_outline),
    //         ),
    //         Text(
    //           quantity.toString(),
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //         IconButton(
    //           onPressed: () => onQuantityChanged(quantity + 1),
    //           icon: const Icon(Icons.add_circle_outline),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).productQuantity,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity > 1) onQuantityChanged(quantity - 1);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 1),
                          ),
                          child: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          onQuantityChanged(quantity + 1);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 1),
                          ),
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

