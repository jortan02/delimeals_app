import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../dummy_data.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ));
}

Widget buildContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      // height: 150,
      width: 300,
      child: child);
}

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "meal-detail";
  final Function(String) toggleFavorite;
  final Function(String) isFavorite;

  const MealDetailScreen({Key key, this.toggleFavorite, this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              )),
          buildSectionTitle(context, "Ingredients"),
          buildContainer(
            ListView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
                itemCount: selectedMeal.ingredients.length),
          ),
          buildSectionTitle(context, "Steps"),
          buildContainer(
            ListView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          leading: CircleAvatar(child: Text('#${index + 1}')),
                          title: Text(
                            selectedMeal.steps[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border), onPressed: () => toggleFavorite(mealId)),
    );
  }
}
