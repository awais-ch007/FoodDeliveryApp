import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Delivery Fee ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                '\$2.5  ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                'Delivery Time ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                '30 Minutes',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
