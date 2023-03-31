import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'FilterScreen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isGlutenFree = widget.currentFilters['Gluten']!;
    _isLactoseFree = widget.currentFilters['Lactose']!;
    _isVegan = widget.currentFilters['Vegan']!;
    _isVegetarian = widget.currentFilters['Vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final _filters = {
                  'Gluten': _isGlutenFree,
                  'Lactose': _isLactoseFree,
                  'Vegan': _isVegan,
                  'Vegetarian': _isVegetarian,
                };
                widget.saveFilters(_filters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              'Filter the meals to your liking',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _isGlutenFree,
                onChanged: (value) => setState(() {
                  _isGlutenFree = value;
                }),
                title: const Text('isGlutenFree'),
              ),
              SwitchListTile(
                value: _isLactoseFree,
                onChanged: (value) => setState(() {
                  _isLactoseFree = value;
                }),
                title: const Text('isLactoseFree'),
              ),
              SwitchListTile(
                value: _isVegan,
                onChanged: (value) => setState(() {
                  _isVegan = value;
                }),
                title: const Text('isVegan'),
              ),
              SwitchListTile(
                value: _isVegetarian,
                onChanged: (value) => setState(() {
                  _isVegetarian = value;
                }),
                title: const Text('isVegetarian'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
