import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:provider/provider.dart';

class MyLocation extends StatelessWidget {
  MyLocation({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Deliver Now',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w300)),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(
            children: [
              Consumer<Restaraunt>(
                  builder: (context, restaraunt, child) => Text(
                      restaraunt.deliveryAddress,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16))),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ]),
    );
  }

  openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Your Address'),
        actions: [
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;

              context.read<Restaraunt>().updateDeliveryAddress(newAddress);

              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Cancel'),
          ),
        ],
        content: TextField(
          controller: textController, // Pass the textController here
          decoration: const InputDecoration(
            hintText: 'Enter your Address',
          ),
        ),
      ),
    );
  }
}
