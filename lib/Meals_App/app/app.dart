import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/categories.screen.dart';
import 'package:practice_app/Meals_App/Screen/category_meal.screen.dart';
import 'package:practice_app/Meals_App/Screen/filter.screen.dart';
import 'package:practice_app/Meals_App/Screen/meals_details.screen.dart';
import 'package:practice_app/Meals_App/router/Screen/tap_screen.router.dart';

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
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       bodyText1: const TextStyle(
        //         color: Color.fromARGB(20, 51, 51, 1),
        //       ),
        // bodyText2: const TextStyle(
        //   color: Color.fromARGB(
        //     20,
        //     51,
        //     51,
        //     51,
        //   ),
        // ),
        //   headline1: const TextStyle(
        //       fontSize: 24,
        //       fontFamily: 'RobotoCondensed',
        //       fontWeight: FontWeight.bold),
        // ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.amber,
        ),
      ),
      // home: const CategoryMealScreen(),

      //** we replace home to initailRoute */
      // initialRoute: '/',
      routes: {
        '/': (context) => const TapBarScreen(),
        // '/category-meal': (ctx) => const CategoryMealScreen(),
        //** Another style for route */
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen(),
        //** This is same the difference is we can find the error in easyWays */
        MealsDetailsScreen.routeName: (ctx) => const MealsDetailsScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen(),
      },
      //** For onGenerateRoute which has some information  */
      // onGenerateRoute: (setting) {
      //   return null;
      // },
      // //** UnknowRoute => reach when flutter failed to build a screen
      //** with all othe measure, when we define nothing on the  route , also don't use
      //** onGenerate route  */  */ */
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
