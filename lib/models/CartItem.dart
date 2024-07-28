// ignore_for_file: file_names

import 'Food.dart';

class CartItem {
  final Food food;
  int quantity;
  List<AddOns> selectedAddons;

  CartItem({
    required this.food,
    this.quantity = 1,
    required this.selectedAddons,
  });
  double getTotalPrice() {
    // ignore: non_constant_identifier_names
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
