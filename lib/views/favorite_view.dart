import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteView extends StatelessWidget {

  final List<Meal> favoriteMeals;
  const FavoriteView(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Favorite meals is empty!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return Mealitem(favoriteMeals[index]);
        },
      );
    }
  }
}