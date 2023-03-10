import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      CategoriesScreen(),
      FavoritesScreen(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];
  }

  int _selectedPageindex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text("DeliMeals")),
        drawer: MainDrawer(),
        body: _pages[_selectedPageindex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            currentIndex: _selectedPageindex,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.category), label: "Categories"),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: "Favorites",
              ),
            ]),
      ),
    );
  }
}
