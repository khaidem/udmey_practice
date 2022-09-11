import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/widget/meal_item.widget.dart';

import '../json_data.dart';
import '../model/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/CategoryMealScreen';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoriesTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

//** didChangeDependencies run couple of time after the initialization of the state
//** It run whenever the didChangeDependencies of this state change and that also */ */ */
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      //** So we extract route argument form categoriesItemScreen  */
      final routes =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      categoriesTitle = routes['title'];
      final categoriesId = routes['id'];

      //** We Iterate form model to find categories Id  */
      displayedMeals = dummyMeals.where((e) {
        return e.categories.contains('c2');
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesTitle!),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: displayedMeals!.length,
            itemBuilder: (ctx, index) {
              return MealItemWidget(
                title: displayedMeals![index].title,
                duration: displayedMeals![index].duration,
                complexity: displayedMeals![index].complexity,
                affordability: displayedMeals![index].affordability,
                imageUrl: displayedMeals![index].imageUrl,
                id: displayedMeals![index].id,
                removeItem: _removeMeal,
              );
            },
          ),
        ],
      ),
    );
  }
}
