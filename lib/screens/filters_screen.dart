import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../main.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "filters";
  final Map<Filters, bool> currentFilters;
  final Function(Map<Filters, bool>) saveFilters;

  const FiltersScreen({Key key, this.currentFilters, this.saveFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override 
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filters.Gluten];
    _lactoseFree = widget.currentFilters[Filters.Lactose];
    _vegan = widget.currentFilters[Filters.Vegan];
    _vegetarian = widget.currentFilters[Filters.Vegetarian];
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue, Function update) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  Filters.Gluten: _glutenFree,
                  Filters.Lactose: _lactoseFree,
                  Filters.Vegan: _vegan,
                  Filters.Vegetarian: _vegetarian
                };
                widget.saveFilters(selectedFilters);
                Navigator.pushReplacementNamed(context, "/");
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.titleLarge,
            )),
        Expanded(
          child: ListView(children: [
            _buildSwitchListTile(
                "Gluten-free", "Only include gluten-free meals", _glutenFree,
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildSwitchListTile(
                "Lactose-free", "Only include Lactose-free meals", _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildSwitchListTile("Vegan", "Only include vegan meals", _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(
                "Vegetarian", "Only include vegetarian meals", _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
          ]),
        )
      ]),
    );
  }
}
