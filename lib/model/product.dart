import 'package:hive_flutter/adapters.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double quantity;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String imagePath;

  Product({
    required this.quantity,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}
