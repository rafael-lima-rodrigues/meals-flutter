import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/views/categories_view.dart';
import 'package:meals/views/favorite_view.dart';

class TabsView extends StatefulWidget {

  final List<Meal> favoriteMeals;
  
  const TabsView(this.favoriteMeals, {super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;
  late List<Map<String,Object>> _views;

    @override
      void initState(){
      super.initState();
      _views = [
    {'title': 'Categories', 'view': CategoriesView()},
    {'title': 'Favorites', 'view': FavoriteView(widget.favoriteMeals)}
    ];
    }
  _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_views[_selectedViewIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _views[_selectedViewIndex]['view'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectView,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedViewIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Favorites '),
        ],
      ),
    );
  }
}
