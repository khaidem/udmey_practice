import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({Key? key}) : super(key: key);
  static const routeName = 'meals-details';

  @override
  Widget build(BuildContext context) {
    //** we get argumnet form meal-item-wigdet */
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealid),
      ),
      body: Center(
        child: Text('The meal - $mealid'),
      ),
    );
  }
}
