import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createitem(IconData icon, String label, VoidCallback onTap){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
         ),
         title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
         ),
         onTap: onTap, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Let\'s Cook?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary
              ),
              ),
          ),
          const SizedBox(height: 20,),
          _createitem(
            Icons.restaurant,
             'Meals',
             () => Navigator.of(context).pushReplacementNamed(AppRoute.HOME),
              ),
          _createitem(
            Icons.settings,
            'Settings',
            () => Navigator.of(context).pushReplacementNamed(AppRoute.SETTINGS),
            ),
         ],
        ),
    );
  }
}