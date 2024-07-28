import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/Food.dart';
import 'package:fooddeliveryapp/pages/FoodPage.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, this.onTap});
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.5),
                  width: 2,
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      food.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${food.price}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      food.imagelink,
                      height: 120,
                      width: 120,
                    ))
              ]),
            ),
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    );
  }
}
