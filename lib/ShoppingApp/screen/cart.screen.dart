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
                      '\$ ${r.totalAmount.toStringAsFixed(2)}',
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
                  OrderButton(r: r),
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
              productId: r.items.values.toList()[i].toString(), index: i,
            ),
            itemCount: r.items.length,
          ))
        ],
      ),
    );
  }
}

//** For Loading Indicator work only  in Order Button  */
class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.r,
  }) : super(key: key);

  final CartProvider r;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Disable the button has no loading we have not check the cart amount this also be disable
      onPressed: (widget.r.totalAmount <= 0 || _isloading)
          ? null
          : () async {
              setState(() {
                _isloading = true;
              });

              //** Convert the list of items object into a list of cart items
              //** object instead  of passing  the whole map */ */
              //** Don't want to listen  to that orderProvider because
              //** not changing my orders */

              await Provider.of<OrderProvider>(context, listen: false).addOrder(
                widget.r.items.values.toList(),
                widget.r.totalAmount,
              );
              setState(() {
                _isloading = false;
              });
              widget.r.clear();
            },
      child: _isloading
          ? const CircularProgressIndicator()
          : const Text(
              'Order Now',
            ),
    );
  }
}
