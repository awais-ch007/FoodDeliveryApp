import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const DrawerTile(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        leading:
            Icon(icon, color: Theme.of(context).colorScheme.inversePrimary),
        title: Text(text,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        onTap: onTap,
      ),
    );
  }
}
