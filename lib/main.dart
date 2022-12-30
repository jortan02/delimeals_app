import 'dart:ui';

import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

enum Filters { Gluten, Lactose, Vegan, Vegetarian }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<Filters, bool> _filters = {
    Filters.Gluten: false,
    Filters.Lactose: false,
    Filters.Vegan: false,
    Filters.Vegetarian: false
  };

  List<Meal> _favoriteMeals = [];

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<Filters, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters[Filters.Gluten] && !meal.isGlutenFree) {
          return false;
        } else if ((_filters[Filters.Lactose] && !meal.isLactoseFree)) {
          return false;
        } else if ((_filters[Filters.Vegan] && !meal.isVegan)) {
          return false;
        } else if ((_filters[Filters.Vegetarian] && !meal.isVegetarian)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
        return existingIndex >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
              .copyWith(secondary: Colors.amberAccent),
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: TextStyle(fontSize: 24, fontFamily: "RobotCondensed"),
              titleMedium:
                  TextStyle(fontSize: 24, fontFamily: "RobotCondensed"))),
      routes: {
        "/": (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite: _toggleFavorite, isFavorite: _isFavorite ,),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters,),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
