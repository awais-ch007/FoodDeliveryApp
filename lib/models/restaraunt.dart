// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/Food.dart';
import 'package:intl/intl.dart';

import 'CartItem.dart';

class Restaraunt extends ChangeNotifier {
  final List<Food> _menu = [
    //Burgers
    Food(
        name: 'BBQ Bacon Burger',
        imagelink: 'assets/images/burger1.png',
        description:
            'Smoky BBQ sauce, crispy bacon and onion rings make this beef burger a savory delight',
        price: 10.99,
        category: FoodCategory.Burgers,
        availableaddons: [
          AddOns(name: 'Grilled Onions', price: 2.00),
          AddOns(name: 'Jalapenos', price: 1.49),
          AddOns(name: 'Extra BBQ Sauce', price: 1.7)
        ]),
    Food(
        name: 'Classic Cheeseburger',
        imagelink: 'assets/images/burger2.png',
        description:
            'A timeless favorite with juicy beef patty, melted cheese, and fresh lettuce and tomato',
        price: 8.99,
        category: FoodCategory.Burgers,
        availableaddons: [
          AddOns(name: 'Bacon', price: 2.50),
          AddOns(name: 'Avocado', price: 1.99),
          AddOns(name: 'Extra Cheese', price: 1.00)
        ]),
    Food(
        name: 'Spicy Chicken Burger',
        imagelink: 'assets/images/burger5.png',
        description:
            'Crispy chicken fillet with spicy mayo, jalapenos, and cheddar cheese for a fiery kick',
        price: 9.49,
        category: FoodCategory.Burgers,
        availableaddons: [
          AddOns(name: 'Grilled Pineapple', price: 1.50),
          AddOns(name: 'Extra Spicy Mayo', price: 0.50),
          AddOns(name: 'Crispy Onions', price: 1.25)
        ]),
    Food(
        name: 'Mushroom Swiss Burger',
        imagelink: 'assets/images/burger1.png',
        description:
            'Savory combination of grilled mushrooms and melted Swiss cheese on a juicy beef patty',
        price: 9.99,
        category: FoodCategory.Burgers,
        availableaddons: [
          AddOns(name: 'Caramelized Onions', price: 1.75),
          AddOns(name: 'Truffle Aioli', price: 2.50),
          AddOns(name: 'Extra Swiss Cheese', price: 1.00)
        ]),
    Food(
        name: 'Black Bean Burger',
        imagelink: 'assets/images/burger2.png',
        description:
            'Plant-based patty made with black beans, topped with avocado, tomato, and red onion',
        price: 8.49,
        category: FoodCategory.Burgers,
        availableaddons: [
          AddOns(name: 'Hummus', price: 1.25),
          AddOns(name: 'Vegan Cheese', price: 1.50),
          AddOns(name: 'Extra Lettuce', price: 0.50)
        ])

    //Pizaa
    ,
    Food(
        name: 'Pepperoni Pizza',
        imagelink: 'assets/images/pizza1.png',
        description:
            'Classic pizza with tangy tomato sauce, melted mozzarella, and crispy pepperoni',
        price: 12.99,
        category: FoodCategory.Pizza,
        availableaddons: [
          AddOns(name: 'Extra Cheese', price: 1.50),
          AddOns(name: 'Sausage', price: 2.00),
          AddOns(name: 'Mushrooms', price: 1.25)
        ]),
    Food(
        name: 'Margherita Pizza',
        imagelink: 'assets/images/pizza2.png',
        description:
            'Simple yet delicious with fresh tomato sauce, mozzarella, and basil',
        price: 10.99,
        category: FoodCategory.Pizza,
        availableaddons: [
          AddOns(name: 'Fresh Garlic', price: 0.75),
          AddOns(name: 'Sun-Dried Tomatoes', price: 1.75),
          AddOns(name: 'Black Olives', price: 1.00)
        ]),
    Food(
        name: 'Supreme Pizza',
        imagelink: 'assets/images/pizza3.png',
        description:
            'Loaded with pepperoni, sausage, mushrooms, onions, and green peppers',
        price: 14.99,
        category: FoodCategory.Pizza,
        availableaddons: [
          AddOns(name: 'Extra Meat', price: 2.50),
          AddOns(name: 'Pineapple', price: 1.50),
          AddOns(name: 'Jalapeños', price: 1.00)
        ]),
    Food(
        name: 'Hawaiian Pizza',
        imagelink: 'assets/images/pizza4.png',
        description:
            'Sweet and savory combination of ham, pineapple, and mozzarella',
        price: 11.99,
        category: FoodCategory.Pizza,
        availableaddons: [
          AddOns(name: 'Bacon', price: 1.75),
          AddOns(name: 'Extra Pineapple', price: 1.25),
          AddOns(name: 'Red Onion', price: 0.75)
        ]),
    Food(
        name: 'Vegetarian Pizza',
        imagelink: 'assets/images/pizza1.png',
        description:
            'Plant-based delight with mushrooms, onions, green peppers, and black olives',
        price: 12.49,
        category: FoodCategory.Pizza,
        availableaddons: [
          AddOns(name: 'Spinach', price: 1.25),
          AddOns(name: 'Roasted Red Peppers', price: 1.50),
          AddOns(name: 'Vegan Cheese', price: 2.00)
        ]),

    Food(
        name: 'Classic Coke',
        imagelink: 'assets/images/drink1.png',
        description: 'The refreshing taste of Coca-Cola',
        price: 2.99,
        category: FoodCategory.Drinks,
        availableaddons: [
          AddOns(name: 'Lemon Slice', price: 0.50),
          AddOns(name: 'Ice', price: 0.25)
        ]),
    Food(
        name: 'Iced Tea',
        imagelink: 'assets/images/drink2.png',
        description: 'Classic iced tea with a hint of lemon',
        price: 2.49,
        category: FoodCategory.Drinks,
        availableaddons: [
          AddOns(name: 'Sweetener', price: 0.25),
          AddOns(name: 'Lemon Wedge', price: 0.25)
        ]),
    Food(
        name: 'Fresh Lemonade',
        imagelink: 'assets/images/drink3.png',
        description: 'Homemade lemonade made with fresh lemons',
        price: 3.49,
        category: FoodCategory.Drinks,
        availableaddons: [
          AddOns(name: 'Raspberry Syrup', price: 0.75),
          AddOns(name: 'Mint Leaves', price: 0.50)
        ]),
    Food(
        name: 'Cappuccino',
        imagelink: 'assets/images/drink2.png',
        description: 'Rich and creamy coffee with frothy milk',
        price: 3.99,
        category: FoodCategory.Drinks,
        availableaddons: [
          AddOns(name: 'Extra Shot', price: 0.75),
          AddOns(name: 'Whipped Cream', price: 0.50)
        ]),
    Food(
        name: 'Bottled Water',
        imagelink: 'assets/images/drink1.png',
        description: 'Refreshed bottled water',
        price: 1.99,
        category: FoodCategory.Drinks,
        availableaddons: []),
    Food(
        name: 'Chocolate Lava Cake',
        imagelink: 'assets/images/dessert1.png',
        description: 'Rich chocolate cake with a molten chocolate center',
        price: 6.99,
        category: FoodCategory.Desserts,
        availableaddons: [
          AddOns(name: 'Vanilla Ice Cream', price: 1.50),
          AddOns(name: 'Whipped Cream', price: 0.75)
        ]),
    Food(
        name: 'Cheesecake',
        imagelink: 'assets/images/dessert3.png',
        description: 'Classic creamy cheesecake with graham cracker crust',
        price: 5.99,
        category: FoodCategory.Desserts,
        availableaddons: [
          AddOns(name: 'Strawberry Topping', price: 1.25),
          AddOns(name: 'Caramel Sauce', price: 1.00)
        ]),
    Food(
        name: 'Apple Pie',
        imagelink: 'assets/images/dessert4.png',
        description:
            'Warm apple pie with flaky crust and cinnamon-spiced filling',
        price: 4.99,
        category: FoodCategory.Desserts,
        availableaddons: [
          AddOns(name: 'Vanilla Ice Cream', price: 1.50),
          AddOns(name: 'Whipped Cream', price: 0.75)
        ]),
    Food(
        name: 'Chocolate Brownie',
        imagelink: 'assets/images/dessert1.png',
        description: 'Decadent chocolate brownie with fudgy texture',
        price: 3.99,
        category: FoodCategory.Desserts,
        availableaddons: [
          AddOns(name: 'Vanilla Ice Cream', price: 1.50),
          AddOns(name: 'Chocolate Sauce', price: 1.00)
        ]),
    Food(
        name: 'Tiramisu',
        imagelink: 'assets/images/dessert3.png',
        description:
            'Classic Italian dessert with coffee-soaked ladyfingers and creamy mascarpone',
        price: 6.49,
        category: FoodCategory.Desserts,
        availableaddons: [
          AddOns(name: 'Chocolate Shavings', price: 0.75),
          AddOns(name: 'Whipped Cream', price: 0.75)
        ]),
    // Food(
    //     name: 'Caesar Salad',
    //     imagelink: 'assets/images/salad1.png',
    //     description:
    //         'Crisp romaine lettuce tossed in creamy Caesar dressing with croutons and Parmesan cheese',
    //     price: 8.99,
    //     category: FoodCategory.salads,
    //     availableaddons: [
    //       AddOns(name: 'Grilled Chicken', price: 4.00),
    //       AddOns(name: 'Shrimp', price: 5.50)
    //     ]),
    // Food(
    //     name: 'Greek Salad',
    //     imagelink: 'assets/images/salad3.png',
    //     description:
    //         'Fresh tomatoes, cucumbers, red onions, feta cheese, and olives with a tangy vinaigrette',
    //     price: 7.99,
    //     category: FoodCategory.salads,
    //     availableaddons: [
    //       AddOns(name: 'Grilled Chicken', price: 4.00),
    //       AddOns(name: 'Falafel', price: 3.50)
    //     ]),
    // Food(
    //     name: 'Cobb Salad',
    //     imagelink: 'assets/images/salad4.png',
    //     description:
    //         'Chopped salad with grilled chicken, bacon, avocado, hard-boiled eggs, and blue cheese crumbles',
    //     price: 10.99,
    //     category: FoodCategory.salads,
    //     availableaddons: [
    //       AddOns(name: 'Extra Bacon', price: 2.00),
    //       AddOns(name: 'Avocado', price: 1.50)
    //     ]),
    // Food(
    //     name: 'Asian Chicken Salad',
    //     imagelink: 'assets/images/salad5.png',
    //     description:
    //         'Grilled chicken with mixed greens, edamame, carrots, and a ginger-soy dressing',
    //     price: 9.49,
    //     category: FoodCategory.salads,
    //     availableaddons: [
    //       AddOns(name: 'Crispy Noodles', price: 1.00),
    //       AddOns(name: 'Extra Ginger-Soy Dressing', price: 0.75)
    //     ]),
    // Food(
    //     name: 'Spinach Salad',
    //     imagelink: 'assets/images/salad1.png',
    //     description:
    //         'Fresh spinach with strawberries, walnuts, and a balsamic vinaigrette',
    //     price: 8.49,
    //     category: FoodCategory.salads,
    //     availableaddons: [
    //       AddOns(name: 'Grilled Salmon', price: 6.50),
    //       AddOns(name: 'Goat Cheese', price: 2.50)
    //     ])

    //
  ];

  List<Food> get menu => _menu;

  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;
  String _deliveryAddress = '99 Hollywood Street';

  String get deliveryAddress => _deliveryAddress;

//Add to cart
  void addtoCart(Food food, List<AddOns> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood & isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        selectedAddons: selectedAddons,
      ));
    }
    notifyListeners();
  }

  //Remove from Cart
  void Remove(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (AddOns addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String _formatPrice(double price) {
    return '\$${(price.toStringAsFixed(2))}';
  }

  String _formatAddons(List<AddOns> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)}))")
        .join(',');
  }

  String displayCartReciept() {
    final receipt = StringBuffer();
    receipt.writeln('Here\'s your receipt..');
    receipt.writeln();
    String formatDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln('Date: $formatDate');
    receipt.writeln();
    receipt.writeln('------------');
    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.food.name} x ${cartItem.quantity} -   ${_formatPrice(cartItem.food.price)}');

      if (cartItem.selectedAddons.isEmpty) {
        receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln();
    receipt.writeln('------------');
    receipt.writeln('Total Item Count: ${getTotalItemCount()}');
    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');

    return receipt.toString();
  }

  updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
}
