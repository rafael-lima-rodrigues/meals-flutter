import 'package:flutter/material.dart';
import 'package:meals/views/categories_view.dart';
import 'package:meals/views/favorite_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;
  final List<Map<String,Object>> _views = [
    {'title': 'Categories', 'view': const CategoriesView()},
    {'title': 'Favorites', 'view': const FavoriteView()}
    ];

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
