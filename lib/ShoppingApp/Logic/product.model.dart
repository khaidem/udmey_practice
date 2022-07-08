import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      this.isFavorite = false,
      required this.price});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
