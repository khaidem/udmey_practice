import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/example/home_screem.dart';

import 'ShoppingApp/example/extract_arguments_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      title: 'Navigation with Arguments',
      home: const HomeScreen(),
    );
  }
}
