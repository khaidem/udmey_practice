import 'package:flutter/cupertino.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';

class OrderItem {
  final String id;
  final double price;
  final List<CartItem> cartProvider;
  final DateTime dateTime;

  OrderItem(
      {required this.cartProvider,
      required this.dateTime,
      required this.id,
      required this.price});
}

class OrderProvider with ChangeNotifier {
  //** we need list of items */
  //** we are doing this so that form outside of class we can't edit orders */
  final List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  //** The idea is that add all  the content  of the card into  one order
  //** Add  is added in the end of the list
  //** insert   is use for add beginning of the list one index ahead to the end */

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        cartProvider: cartProducts,
        dateTime: DateTime.now(),
        id: DateTime.now().toString(),
        price: total,
      ),
    );
    notifyListeners();
  }
}
