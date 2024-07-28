import 'package:flutter/material.dart';

import '../pages/Cart_Page.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.title, required this.child});
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Home'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
      expandedHeight: 340,
      collapsedHeight: 120,
      pinned: true,
      floating: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
        ),
      ],
    );
  }
}
