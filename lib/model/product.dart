import 'package:hive_flutter/adapters.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String name;

  @HiveField(1)
  double quantity;

  @HiveField(2)
  double price;

  @HiveField(3)
  String imagePath;

  Product({
    required this.name,

    required this.quantity,
    required this.price,
    required this.imagePath,
  });
}
