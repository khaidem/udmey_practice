import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/categories_item.dart';
import 'package:practice_app/Meals_App/Screen/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal  '),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: dummyCategories
            .map((e) => CategriesItem(
                  title: e.title,
                  color: e.colors,
                  id: e.id,
                ))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
