// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/Food.dart';
import '../models/restaraunt.dart';
import '../widgets/custom_button.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});

  final Food food;

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<AddOns, bool> selectedAddons = {};

  @override
  void initState() {
    super.initState();
    for (AddOns addons in widget.food.availableaddons) {
      selectedAddons[addons] = false;
    }
  }

  void addtoCart(Food food, Map<AddOns, bool> selectedAddons) {
    Navigator.pop(context);
    List<AddOns> currentlySelectedAddons = [];
    for (AddOns addons in widget.food.availableaddons) {
      if (selectedAddons[addons] == true) {
        currentlySelectedAddons.add(addons);
      }
    }
    context.read<Restaraunt>().addtoCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          body: SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                widget.food.imagelink,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${widget.food.price}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'AddOns',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.7),
                              width: 3)),
                      child: ListView.builder(
                          itemCount: widget.food.availableaddons.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            AddOns addons = widget.food.availableaddons[index];
                            return CheckboxListTile(
                                value: selectedAddons[addons],
                                title: Text(
                                  addons.name,
                                ),
                                subtitle: Text('\$${addons.price}'),
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedAddons[addons] = value!;
                                  });
                                });
                          }),
                    )
                  ],
                ),
              ),
              CustomButton(
                  text: 'Add to Cart',
                  onTap: () {
                    addtoCart(widget.food, selectedAddons);
                  }),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
