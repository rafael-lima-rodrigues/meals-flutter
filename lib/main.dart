import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/views/categories_meals_view.dart';
import 'package:meals/views/categories_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
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
        AppRoute.HOME: (ctx) => CategoriesView(),
        AppRoute.CATEGORIES_MEALS: (ctx) => CategoryMealsView(),
      },
    );
  }
}
