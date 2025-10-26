import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: colorsScheme.surface),

      body: Column(
        children: [
          //
          Text(
            'Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
