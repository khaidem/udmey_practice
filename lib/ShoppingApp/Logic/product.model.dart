import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductModel with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    required this.price,
  });

  void _setFavorite(bool newFavorite) {
    isFavorite = newFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;

    notifyListeners();
    final url = Uri.parse(
        //** Different Url Send For Favorite */
        'https://udmeypractice-default-rtdb.firebaseio.com/userFavorite/$userId/$id.json?auth=$token');
    try {
      //** we don't want old value there all the time when we switch our status instead override the
      //** existing status (patch request) */ */
      // final response = await http.patch(
      final response = await http.put(
        url,
        body: json.encode(
          //** we onlySend true or false */
          // 'isFavorite': isFavorite,
          isFavorite,
        ),
      );
      if (response.statusCode >= 400) {
        _setFavorite(oldStatus);
      }
    } catch (error) {
      _setFavorite(oldStatus);
    }
  }
}
