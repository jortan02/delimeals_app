import 'dart:ui';

import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 32,
            fontFamily: "RobotCondensed"
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontFamily: "RobotCondensed"
          )
        )
      ),
      home: CategoriesScreen(),
      routes:  {
        // "/": (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen()
      },
    );
  }
}