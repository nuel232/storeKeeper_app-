import 'package:flutter/material.dart';
import 'package:store_keeper_app/model/product.dart';
import 'package:store_keeper_app/services/database/databae_helper.dart';

class ProductDatabase extends ChangeNotifier {
  List<Product> _currentProducts = [];
  List<Product> get currentProducts => _currentProducts;

  // Load products
  Future<void> loadProducts() async {
    _currentProducts = await DatabaseHelper.instance.readAllProducts();

    // Add initial data if empty
    if (_currentProducts.isEmpty) {
      await _addInitialData();
      _currentProducts = await DatabaseHelper.instance.readAllProducts();
    }

    notifyListeners();
  }

  Future<void> _addInitialData() async {
    final products = [
      Product(
        name: 'Jordan 1',
        quantity: 2,
        price: 400,
        imagePath: 'assets/Air-deldon.png',
      ),
      Product(
        name: 'Jordan 2',
        quantity: 3,
        price: 450,
        imagePath: 'assets/Tatum-3-tie-dye2.png',
      ),
      Product(
        name: 'Jordan 3',
        quantity: 1,
        price: 500,
        imagePath: 'assets/Zoom-freek-4.jpg',
      ),
    ];

    for (var product in products) {
      await DatabaseHelper.instance.createProduct(product);
    }
  }

  // CREATE
  Future<void> addProduct(Product product) async {
    await DatabaseHelper.instance.createProduct(product);
    await loadProducts();
  }

  // UPDATE
  Future<void> updateProduct(Product product) async {
    await DatabaseHelper.instance.updateProduct(product);
    await loadProducts();
  }

  // DELETE
  Future<void> deleteProduct(int id) async {
    await DatabaseHelper.instance.deleteProduct(id);
    await loadProducts();
  }
}
