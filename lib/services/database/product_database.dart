import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_keeper_app/model/product.dart';

class ProductDatabase extends ChangeNotifier {
  static late Box<Product> _productBox;

  //initialize Hive Box and open the product Box
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    _productBox = await Hive.openBox<Product>('product');
  }

  //create
  Future<void> addProduct() async {}
}
