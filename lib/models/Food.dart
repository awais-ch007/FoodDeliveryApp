// ignore_for_file: file_names, constant_identifier_names

class Food {
  final String name;
  final String imagelink;
  final String description;
  final double price;
  final FoodCategory category;
  List<AddOns> availableaddons;

  Food({
    required this.name,
    required this.imagelink,
    required this.description,
    required this.price,
    required this.category,
    required this.availableaddons,
  });
}

enum FoodCategory {
  Burgers,
  // salads,
  Pizza,
  Desserts,
  Drinks,
}

class AddOns {
  String name;
  double price;

  AddOns({
    required this.name,
    required this.price,
  });
}
