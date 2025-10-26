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
  ProductTile({
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
        title: Text(name),
        subtitle: Row(
          children: [
            Text(quantity.toString()),
            SizedBox(width: 20),
            Text(price.toString()),
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
