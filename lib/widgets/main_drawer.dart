import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.secondary),
          child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }
}
