import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/router/Screen/main_drawer.screen.router.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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
