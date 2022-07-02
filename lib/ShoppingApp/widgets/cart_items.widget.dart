import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:provider/provider.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId})
      : super(key: key);
  final String id;
  final String price;
  final int quantity;
  final String title;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).remove(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(child: Text('\$$price')),
            )),
            title: Text(title),
            subtitle: Text('Total:\$${price * quantity}'),
            trailing: Text('$quantity'),
          ),
        ),
      ),
    );
  }
}
