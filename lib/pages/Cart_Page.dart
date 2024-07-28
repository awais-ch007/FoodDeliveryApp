// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:fooddeliveryapp/pages/Payment_Page.dart';
import 'package:fooddeliveryapp/widgets/Cart_Tile.dart';
import 'package:fooddeliveryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaraunt>(
      builder: (context, restaraunt, child) {
        final userCart = restaraunt.cart;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Cart "),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: const Text("Delete Cart"),
                              content: const Text(
                                  "Are you sure you want to delete your cart?"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel")),
                                TextButton(
                                    onPressed: () {
                                      restaraunt.clearCart();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Yes'))
                              ]));
                  //   restaraunt.clearCart();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: Text('Your Cart is Empty'),
                          ))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  final cartItem = userCart[index];
                                  return CartTile(
                                    cartItem: cartItem,
                                  );
                                }))
                  ],
                ),
              ),
              CustomButton(
                  text: 'Check Out',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentPage()));
                  }),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
