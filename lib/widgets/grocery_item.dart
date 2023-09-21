import 'package:flutter/material.dart';

import '../models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 16,
          width: 16,
        ),
        Text(grocery.name),
        Text(grocery.quantity.toString())
      ],
    );
  }
}
