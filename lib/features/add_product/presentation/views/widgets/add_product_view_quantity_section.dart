import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class AddProductViewQuantitySection extends StatefulWidget {
  const AddProductViewQuantitySection({
    super.key,
    required this.quantityController,
    required this.onQuantityChanged,
  });
  final int quantityController;
  final Function(int) onQuantityChanged;
  @override
  State<AddProductViewQuantitySection> createState() =>
      _AddProductViewQuantitySectionState();
}

class _AddProductViewQuantitySectionState
    extends State<AddProductViewQuantitySection> {
  @override
  Widget build(BuildContext context) {
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
                          if (widget.quantityController > 1) {
                            setState(() {
                              widget.onQuantityChanged(
                                  widget.quantityController - 1);
                            });
                          }
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
                        '${widget.quantityController}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.onQuantityChanged(
                                widget.quantityController + 1);
                          });
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
