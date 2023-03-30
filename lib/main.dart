import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/views/categories_meals_view.dart';
import 'package:meals/views/meal_detail_view.dart';
import 'package:meals/views/settings_view.dart';
import 'package:meals/views/tabs_view.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final theme = ThemeData();
  
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose =  settings.isGlutenFree && !meal.isLactoseFree;
        final filterVegan =  settings.isVegan && !meal.isVegan;
        final filterVegetarian =  settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegetarian && !filterVegan;
      })
      .toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
      ? _favoriteMeals.remove(meal)
      : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Cook?',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ).copyWith(secondary: Colors.amber),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                    fontSize: 20, fontFamily: 'RobotoCondensed'),
              ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
      initialRoute: AppRoute.HOME,
      routes: {
        AppRoute.HOME: (ctx) => TabsView(_favoriteMeals),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoryMealsView(_availableMeals),
        AppRoute.MEALS_DETAIL: (ctx) => MealDetailView(_toggleFavorite, _isFavorite),
        AppRoute.SETTINGS: (ctx) => SettingsView(settings, _filterMeals),
      },
    );
  }
}
