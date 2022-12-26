import "package:flutter/material.dart";
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "category-meals";
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen({Key key, this.categoryId, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArguments["title"];
    final categoryId = routeArguments["id"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Text(categoryMeals[index].title);
      }, itemCount: categoryMeals.length,),
    );
  }
}
