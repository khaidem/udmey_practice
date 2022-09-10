import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color colors;

  Category(
      {required this.id, required this.title, this.colors = Colors.orange});
}
