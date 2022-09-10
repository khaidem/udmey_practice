import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/json_data.dart';
import 'package:practice_app/Meals_App/widget/meal_item.widget.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/CategoryMealScreen';

  @override
  Widget build(BuildContext context) {
    //** So we extract route argument form categoriesItemScreen  */
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoriesTitle = routes['title'];
    final categoriesId = routes['id'];

    //** We Iterate form model to find categories Id  */
    final categoriesMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoriesId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesTitle),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: categoriesMeal.length,
          itemBuilder: (ctx, index) {
            return MealItemWidget(
              title: categoriesMeal[index].title,
              duration: categoriesMeal[index].duration,
              complexity: categoriesMeal[index].complexity,
              affordability: categoriesMeal[index].affordability,
              imageUrl: categoriesMeal[index].imageUrl,
              id: categoriesMeal[index].id,
            );
          }),
    );
  }
}
