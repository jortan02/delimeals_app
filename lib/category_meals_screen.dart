import "package:flutter/material.dart";
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen({Key key, this.categoryId, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArguments["title"];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(child: Text("The Recipes For The Category!")),
    );
  }
}
