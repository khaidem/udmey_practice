import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:practice_app/ShoppingApp/models/http_exception.dart';

import 'product.model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> _items = [
    // ProductModel(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //   // isFavorite: null,
    // ),
    // ProductModel(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    //   // isFavorite: null,
    // ),
    // ProductModel(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    //   // isFavorite: null,
    // ),
    // ProductModel(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    //   // isFavorite: null,
    // ),
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

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/product.json');
    try {
      final response = await http.get(url);
      final extraData = json.decode(response.body) as Map<String, dynamic>?;
      final List<ProductModel> loadedProduct = [];
      if (extraData == null) {
        return;
      }
      extraData.forEach((proId, prodData) {
        loadedProduct.add(ProductModel(
            id: proId,
            title: prodData['title'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            price: prodData['price']));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

//** For add newProduct for edit_Product_Screen */
//*** The product which is missing and ID  */
//** Sending post request */
  // Future<void> addProduct(ProductModel productModel) async {
  //   final url = Uri.parse(
  //       'https://udmeypractice-default-rtdb.firebaseio.com/product.json');

  //   await http
  //       .post(
  //     url,
  //     body: json.encode(
  //       {
  //         'title': productModel.title,
  //         'description': productModel.description,
  //         'imageUrl': productModel.imageUrl,
  //         'price': productModel.price,
  //         'isFavorite': productModel.isFavorite,
  //       },
  //     ),
  //   )
  //       .then((response) {
  //     log(json.encode(response.body));
  //     final newProduct = ProductModel(
  //       id: json.decode(response.body)['name'],
  //       title: productModel.title,
  //       description: productModel.description,
  //       imageUrl: productModel.imageUrl,
  //       price: productModel.price,
  //     );
  //     _items.add(newProduct);
  //     // _items.insert(0, newProduct); //* at the start of the list
  //     notifyListeners();
  //     //** return inside anonymous function */
  //     // return Future.value();
  //   }).catchError((error) {
  //     throw error;
  //   });
  // }

  //** Using Try Catch Block above method is same
  //* Same as then and catch Block */
  Future<void> addProduct(ProductModel productModel) async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/product.json');

    try {
      final response = await http.post(
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
      log(json.encode(response.body));
      final newProduct = ProductModel(
        id: json.decode(response.body)['name'],
        title: productModel.title,
        description: productModel.description,
        imageUrl: productModel.imageUrl,
        price: productModel.price,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); //* at the start of the list
      notifyListeners();
      print(
        json.decode(response.body)['name'],
      );
      //** return inside anonymous function */
      // return Future.value();
    } catch (error) {
      rethrow;
    }
  }

//** For update EditProductScreen */
//** as (async) code it will  automatically wrapped  into a future*/
//** (await) key dart tell that we want to wait for that operation to
//** finish before we move on to the next line of Dart code  */ */

//** In (try) block which add all the code eventually fail ,
//** Not put your code which could fail because you were lazy to properly test it but
//** user input or internet connection */ */ */

  //** This is upDate Locally or into the device */
  // void updateProduct(String id, ProductModel newProduct) {
  //   final prodIndex = _items.indexWhere((prod) => prod.id == id);
  //   if (prodIndex >= 0) {
  //     _items[prodIndex] = newProduct;
  //     notifyListeners();
  //   } else {
  //     print('...');
  //   }
  // }

  //** Using Firebase runTime */
  Future<void> updateProduct(String id, ProductModel newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://udmeypractice-default-rtdb.firebaseio.com/product/$id.json');
      //** Sending a patch request will tell to merge the data which is encoming
      //** with the existing data as that address you are sending it to. */ */
      await http.patch(
        url,
        body: json.encode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
            'isFavorite': newProduct.isFavorite,
          },
        ),
      );
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  //**Delete edit_Product_Screen */

  void deleteProduct(String id) async {
    final url = Uri.parse(
        'https://udmeypractice-default-rtdb.firebaseio.com/product/$id.json');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    ProductModel? existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('could not delete Product');
    }
    existingProduct = null;
  }
}
