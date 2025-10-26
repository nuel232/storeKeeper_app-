import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_keeper_app/model/product.dart';

class ProductDatabase extends ChangeNotifier {
  static late Box<Product> _productBox;
  List<Product> get currentProducts => _productBox.values.toList();

  //initialize Hive Box and open the product Box
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    _productBox = await Hive.openBox<Product>('product');
  }

  //create initial products
  //run if it is the first time
  void initialData() {
    List<Product> initalProducts = [
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
    ];
  }

  //create
  void addProduct(Product newProduct) async {
    await _productBox.add(newProduct);
    notifyListeners();
  }

  //read
  void loadProduct() {
    // If box is empty, it's the first time - add initial data
    if (_productBox.isEmpty) {
      initialData();
    }
    // Notify listeners so UI rebuilds with products
    notifyListeners();
  }

  //update
  void updateProduct(
    int index,
    String newName,
    double newPrice,
    double newQuantity,
    String newImagePath,
  ) async {
    final product = _productBox.getAt(index);
    if (product != null) {
      product.name = newName;
      product.price = newPrice;
      product.quantity = newQuantity;
      product.imagePath = newImagePath;
      await _productBox.putAt(index, product);
      notifyListeners();
    }
  }

  // Delete a product
  void deleteProduct(int index) async {
    await _productBox.deleteAt(index);
    notifyListeners();
  }
}
