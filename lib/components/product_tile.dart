import 'dart:io';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:store_keeper_app/components/settings.dart';

class ProductTile extends StatelessWidget {
  final String name;
  final double price;
  final double quantity;
  final String imagePath;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const ProductTile({
    super.key,
    required this.name,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.imagePath,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        leading: imagePath.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(imagePath),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image),
              ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Text('Qty: ${quantity.toInt()}'),
            SizedBox(width: 20),
            Text('\$${price.toStringAsFixed(2)}'),
          ],
        ),
        trailing: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showPopover(
              width: 100,
              height: 100,
              backgroundColor: Theme.of(context).colorScheme.surface,
              context: context,
              bodyBuilder: (context) => Settings(
                onDeleteTap: onDeletePressed,
                onEditTap: onEditPressed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
