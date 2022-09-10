import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/meals_details.screen.dart';
import 'package:practice_app/Meals_App/model/meal.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id})
      : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  //** Now we need to Translate our enum here into text which we can output for now
  //** we need getter  */ */

  String get ComplexityText {
    //** switch statements  is also same as if else */
    //** For Switch we need to  define value first to analyze  */
    //** For break use to make sure that no other case is considered in this swith case  */
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      //** Default is trigger if complexity has a value you not covering
      //** in our case and the dafult */ */
      default:
        return 'Unknow';
    }
  }

  //** enum value into human readable  */
  String get affordabilityText {
    //** switch statements  is also same as if else */
    //** For Switch we need to  define value first to analyze  */
    //** For break use to make sure that no other case is considered in this swith case  */
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Expensive';
        break;
      //** Default is trigger if complexity has a value you not covering
      //** in our case and the dafult */ */
      default:
        return 'Unknow';
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealsDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(width: 6),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(width: 6),
                      Text(ComplexityText),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
