import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/Food.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIcrement,
      required this.onDecrement});
  final int quantity;
  final Food food;
  final VoidCallback onIcrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Add this
          children: [
            Flexible(
              // Wrap with Flexible
              child: GestureDetector(
                onDoubleTap: onDecrement,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: FittedBox(
                    // Add FittedBox
                    child: Icon(Icons.remove,
                        size: 20, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
            //quantity
            Flexible(
              // Wrap with Flexible
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FittedBox(
                  // Add FittedBox
                  child: Center(child: Text(quantity.toString())),
                ),
              ),
            ),
            Flexible(
              // Wrap with Flexible
              child: GestureDetector(
                onDoubleTap: onIcrement,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: FittedBox(
                    // Add FittedBox
                    child: Icon(Icons.add,
                        size: 20, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
