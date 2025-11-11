import 'package:flutter/material.dart';

import 'package:testing/screens/categories_screen.dart';
import 'package:testing/screens/favourite_screen.dart';
import 'package:testing/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var activePageIndex = 0;
  void updateIndex(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();

    var activePageTitle = 'Categories';
    if (activePageIndex == 1) {
      setState(() {
        activePageTitle = 'Favourites';
        activeScreen = const FavouritesScreen();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePageIndex,
        onTap: updateIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
