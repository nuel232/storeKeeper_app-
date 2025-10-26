import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_keeper_app/components/product_tile.dart';
import 'package:store_keeper_app/services/database/product_database.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    // Load products when page opens
    Future.microtask(
      () => Provider.of<ProductDatabase>(context, listen: false).loadProducts(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<ProductDatabase>(context);
    final products = database.currentProducts;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                'No products yet!\nTap + to add one',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(
                  name: product.name,
                  price: product.price,
                  quantity: product.quantity,
                  imagePath: product.imagePath,
                  onEditPressed: () {
                    _showEditDialog(context, product, database);
                  },
                  onDeletePressed: () {
                    database.deleteProduct(product.id!);
                  },
                );
              },
            ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    product,
    ProductDatabase database,
  ) {
    final nameController = TextEditingController(text: product.name);
    final quantityController = TextEditingController(
      text: product.quantity.toString(),
    );
    final priceController = TextEditingController(
      text: product.price.toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Edit Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              product.name = nameController.text;
              product.quantity = double.parse(quantityController.text);
              product.price = double.parse(priceController.text);
              database.updateProduct(product);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
