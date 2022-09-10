import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/model/meal.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget(
      {Key? key,
      required this.title,
      // required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);
  final String title;
  // final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: const [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                // child: Image.network(
                //   // imageUrl,
                //   height: 250,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              )
            ],
          )
        ],
      ),
    );
  }
}
