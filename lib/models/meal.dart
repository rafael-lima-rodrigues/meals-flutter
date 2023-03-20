import 'package:meals/enums/complexity.dart';
import 'package:meals/enums/cost.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.ingredients,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Easy';
      case Complexity.medium:
        return 'Normal';
      case Complexity.difficult:
        return 'Hard';
      default:
        return 'Unknow';
    }
  }

String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Cheap';
      case Cost.fair:
        return 'Fair Price';
      case Cost.expensive:
        return 'Expensive';
      default:
        return 'Unknow';
    }
  }
}
