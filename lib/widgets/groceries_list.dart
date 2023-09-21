import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList(
      {super.key, required this.groceryItems, required this.onRemoveListItem});

  final List<GroceryItem> groceryItems;
  final Function(int index) onRemoveListItem;
  @override
  Widget build(BuildContext context) {
    if (groceryItems.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: const Text(
          'No items, add some!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) {
        final item = groceryItems[index];
        return Dismissible(
          key: Key(item.id),
          onDismissed: (direction) {
            onRemoveListItem(index);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item dismissed'),
              ),
            );
          },
          child: ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
                width: 24,
                height: 24,
                color: groceryItems[index].category.color),
            trailing: Text(
              groceryItems[index].quantity.toString(),
            ),
          ),
        );
      },
    );
  }
}
