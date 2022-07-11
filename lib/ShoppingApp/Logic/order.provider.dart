import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double price;
  final List<CartItem> cartProduct;
  final DateTime dateTime;

  OrderItem(
      {required this.cartProduct,
      required this.dateTime,
      required this.id,
      required this.price});
}

class OrderProvider with ChangeNotifier {
  //** we need list of items */
  //** we are doing this so that form outside of class we can't edit orders */
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  //** The idea is that add all  the content  of the card into  one order
  //** Add  is added in the end of the list
  //** insert   is use for add beginning of the list one index ahead to the end */

//** Add OrderNow to Firebase */
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/orders.json');
    final timeStamp = DateTime.now();
    // send OrderNow to Firebase
    final response = await http.post(
      url,
      body: json.encode(
        {
          'amount': total,
          'dateTime': DateTime.now().toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        },
      ),
    );
    // this is into the device locally enter
    _orders.insert(
      0,
      OrderItem(
        cartProduct: cartProducts,
        dateTime: timeStamp,
        //** Auto generate Id for Order */
        id: json.decode(response.body)['name'],

        price: total,
      ),
    );
    notifyListeners();
  }

//** Fetch Data form Firebase For orderNow */
  Future<void> fetchOrder() async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);
    print(json.decode(response.body));

    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>?;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach(
      (orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            cartProduct: (orderData['product'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    price: item['price'],
                    quantity: item['quantity'],
                  ),
                )
                .toList(),
            dateTime: DateTime.parse(
              orderData['dateTime'],
            ),
            id: orderId,
            price: orderData['price'],
          ),
        );
      },
    );
    // ** Show latest order form list Using reversed */
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }
}
