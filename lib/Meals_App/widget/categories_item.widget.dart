import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/category_meal.screen.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);
  final String title;
  final Color color;
  final String id;

  void selectedCategory(BuildContext ctx) {
    //** When we push, we create the route on the fly with the MaterialPageRoute Class */
    //** As For pushName We have to setup route in MyApp/main.dart */
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
