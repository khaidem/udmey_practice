import 'package:flutter/cupertino.dart';

class CartItem {
  final String title;

  final double price;
  final int quantity;
  final String id;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem>? _items = {};
//** we use Spread opreator because here on Items to pull  out the key-value pairs
//** form this items map and  add it to  a new map to return a copy  and add
//** the get keyword in fornt of that */ */ */
  Map<String, CartItem> get items {
    return {..._items!};
  }

  //** How many Items are there
  //* Item count  */
  int get itemCount {
    return _items!.length;
  }

//*** For total amount solve  */
  double get totalAmount {
    var total = 0.0;
    //* ForEach use for excute function on every entry in the map
    //* and it will receive that entry  as an argument, to be precise
    //* it will receive the key and the value  for the entry */
    _items!.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //* Adding an items
  void add(String productId, double price, String title) {
    if (_items!.containsKey(productId)) {
      //** change quantity only */
      _items!.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          price: price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      _items!.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

//** getting rid of an entry in a map */
  void remove(String productId) {
    _items!.remove(productId);
    notifyListeners();
  }

  //** placing and order mean that we need clear the cart because we orderded all
  //** elemnents , so that cart should be cleared   */ */

  void clear() {
    _items = {};
    notifyListeners();
  }

  //** Remove Single Item form the cart */
  void removeSingleItem(String productId) {
    //**--  if item is not in the cart return by checking key */
    if (_items!.containsKey(productId)) {
      return;
    }

    ///*** if item is found we nedd update */
    if (_items![productId]!.quantity > 1) {
      _items!.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          quantity: value.quantity - 1,
        ),
      );
    } else {
      _items!.remove(productId);
    }
    notifyListeners();
  }
}
