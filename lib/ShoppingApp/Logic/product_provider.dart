import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

import 'product.model.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductModel> _items = [
    ProductModel(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      // isFavorite: null,
    ),
    ProductModel(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
      // isFavorite: null,
    ),
    ProductModel(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
      // isFavorite: null,
    ),
    ProductModel(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      // isFavorite: null,
    ),
  ];

  //** use getter -- Is a list of product of single product items */

  // var showFavoriteOnly = false;

  List<ProductModel> get items {
    // if (showFavoriteOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

//* For using only single widget filter
  // void showFavoriteOnly() {
  //   showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   showFavoriteOnly = false;
  //   notifyListeners();
  // }

  ProductModel findId(String id) {
    return items.firstWhere((element) => element.id == id);
  }

//** For Favorite item  */
  List<ProductModel> get favoriteItem {
    return _items.where((proItem) => proItem.isFavorite).toList();
  }

//** For add newProduct for edit_Product_Screen */
//*** The product which is missing and ID  */
//** Sending post request */
  void addProduct(ProductModel productModel) async {
    var url =
        Uri.parse('https://udmeypractice-default-rtdb.firebaseio.com.json');

    http.post(
      url,
      body: json.encode(
        {
          'title': productModel.title,
          'description': productModel.description,
          'imageUrl': productModel.imageUrl,
          'price': productModel.price,
          'isFavorite': productModel.isFavorite,
        },
      ),
    );
    // http.post(url, body: json.encode);
    final newProduct = ProductModel(
      id: DateTime.now().toString(),
      title: productModel.title,
      description: productModel.description,
      imageUrl: productModel.imageUrl,
      price: productModel.price,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); //* at the start of the list
    notifyListeners();
  }

//** For update EditProductScreen */
//** as (async) code it will  automatically wrapped  into a future*/
//** (await) key dart tell that we want to wait for that operation to
//** finish before we move on to the next line of Dart code  */ */

//** In (try) block which add all the code eventually fail ,
//** Not put your code which could fail because you were lazy to properly test it but
//** user input or internet connection */ */ */

  void updateProduct(String id, ProductModel newProduct) {
    final proIndex = _items.indexWhere((element) => element.id == id);
    if (proIndex >= 0) {
      _items[proIndex] = newProduct;
      notifyListeners();
    } else {
      log('no product found');
    }
  }

  //**Delete edit_Product_Screen */

  void deleteProduct(String id) {
    log('delete form Provider');
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
