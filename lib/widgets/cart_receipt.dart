import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:provider/provider.dart';

class CartReceipt extends StatelessWidget {
  const CartReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Thank You for Ordering..."),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(25),
            child: Consumer<Restaraunt>(
                builder: (context, restaraunt, child) =>
                    Text(restaraunt.displayCartReciept())),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("Estimated Delivery Time -  4:10 PM")
        ]),
      ),
    );
  }
}
