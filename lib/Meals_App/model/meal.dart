enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final String title;

  final List<String> ingredents;
  final String imageUrl;
  final List<String> setps;
  final int duration;

  final List<String> categories;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Meal({
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.ingredents,
    required this.imageUrl,
    required this.setps,
    required this.duration,
    required this.complexity,
    required this.categories,
    required this.id,
    required this.title,
    required this.affordability,
  });
}
