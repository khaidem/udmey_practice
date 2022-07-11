import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:http/http.dart' as http;

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

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/orders.json');
    final timeStamp = DateTime.now();
    final response = await http.patch(
      url,
      body: json.encode(
        {
          'amount': total,
          'dateTime': DateTime.now().toIso8601String(),
          'products': cartProducts
              .map((e) => {
                    'id': e.id,
                    'title': e.title,
                    'quantity': e.quantity,
                    'price': e.price,
                  })
              .toList(),
        },
      ),
    );
    // this is into the device locally enter
    _orders.insert(
      0,
      OrderItem(
        cartProvider: cartProducts,
        dateTime: timeStamp,
        //** Auto generate Id for Order */
        id: DateTime.now().toString(),
        price: total,
      ),
    );
    notifyListeners();
  }
}
