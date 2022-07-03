import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:practice_app/ShoppingApp/Logic/order.provider.dart';
import 'package:practice_app/ShoppingApp/widgets/cart_items.widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final r = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${r.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //** Convert the list of items object into a list of cart items
                      //** object instead  of passing  the whole map */ */
                      //** Don't want to listen  to that orderprovider because  not changing my orders */
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrder(
                        r.items.values.toList(),
                        r.totalAmount,
                      );
                      r.clear();
                    },
                    child: const Text(
                      'Order Now',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            itemBuilder: (cxt, i) => CartItemsWidget(
              //** Use 'value' property which give  you an interable  which you
              //* can convert a list so that we can  access the i element  */
              id: r.items.values.toList()[i].id,
              price: r.items.values.toList()[i].price.toString(),
              quantity: r.items.values.toList()[i].quantity,
              title: r.items.values.toList()[i].title,
              productId: r.items.values.toList()[i].toString(),
            ),
            itemCount: r.items.length,
          ))
        ],
      ),
    );
  }
}
