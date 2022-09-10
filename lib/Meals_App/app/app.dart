import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/categories_screen.dart';
import 'package:practice_app/Meals_App/Screen/category_meal.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // canvasColor: const Color.fromARGB(255, 254, 229, 1),
        fontFamily: 'Raleway',
        // 'title is the term used in the 2014 version of material design.
        // The modern term is headline6. ' 'This feature was deprecated after v1.13.8.'
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromARGB(
                  20,
                  51,
                  51,
                  51,
                ),
              ),
              headline1: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: const CategoriesScreen(),
      routes: {
        // '/category-meal': (ctx) => const CategoryMealScreen(),
        //** Another style for route */
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        //** This is same the difference is we can find the error in easyWays */
      },
    );
  }
}
