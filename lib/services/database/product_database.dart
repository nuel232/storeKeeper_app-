import 'package:flutter/material.dart';
import 'package:store_keeper_app/model/product.dart';
import 'package:store_keeper_app/services/database/databae_helper.dart';

class ProductDatabase extends ChangeNotifier {
  List<Product> _currentProducts = [];
  List<Product> get currentProducts => _currentProducts;

  // Load products
  Future<void> loadProducts() async {
    _currentProducts = await DatabaseHelper.instance.readAllProducts();

    notifyListeners();
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
