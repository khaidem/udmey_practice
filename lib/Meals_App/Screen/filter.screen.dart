import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/router/Screen/main_drawer.screen.router.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {Key? key, required this.saveFilter, required this.currentFliter})
      : super(key: key);
  static const routeName = '/filters';
  final Function()? saveFilter;
  final Map<String, bool> currentFliter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    _glutenFree = widget.currentFliter['gluten']!;
    _lactoseFree = widget.currentFliter['lactose']!;

    super.initState();
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: const Text('Only include gluten-free meals'),
    );
  }

  bool _glutenFree = false;

  bool _lactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filer'),
        actions: [
          IconButton(
            onPressed: () {
              //** ForWard the data   where user filter selected */
              final selecteFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
              };
              widget.saveFilter!();
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                'Glutteen Free',
                'only Gluten-free',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              buildSwitchTile(
                'Lastoce Free',
                'only Lactose-free',
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
