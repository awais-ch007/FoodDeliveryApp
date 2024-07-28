// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:fooddeliveryapp/widgets/quantity_selector.dart';
import 'package:provider/provider.dart';

import '../models/CartItem.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Consumer<Restaraunt>(
        builder: (context, restaraunt, child) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.imagelink,
                          height: 108,
                          width: width * 0.2,
                        )),
                    Container(
                      width: width * 0.28,
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                          ),
                          Text(
                            '\$${cartItem.food.price}',
                          ),
                        ],
                      ),
                    ),
                    QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onIcrement: () {
                          restaraunt.addtoCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                        onDecrement: () {
                          restaraunt.Remove(cartItem);
                        })
                  ],
                ),
                SizedBox(
                  height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    children: cartItem.selectedAddons
                        .map(
                          (addons) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Row(children: [
                                Text(addons.name),
                                Text(' \$${addons.price}'),
                              ]),
                              shape: StadiumBorder(
                                  side:
                                      BorderSide(color: Colors.grey.shade500)),
                              onSelected: (value) {},
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ]),
            ));
  }
}
