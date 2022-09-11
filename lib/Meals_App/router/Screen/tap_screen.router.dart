import 'package:flutter/material.dart';
import 'package:practice_app/Meals_App/Screen/categories.screen.dart';
import 'package:practice_app/Meals_App/Screen/favorite.screen.dart';
import 'package:practice_app/Meals_App/router/Screen/main_drawer.screen.router.dart';

class TapBarScreen extends StatefulWidget {
  const TapBarScreen({Key? key}) : super(key: key);

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  int _selectedPageIndex = 0;
  // final List<Map<String, Object?>> _page = [
  //   {'Page': const CategoriesScreen(), 'title': 'Categories'},
  //   {'Page': const FaveroiteScreen(), 'title': 'Favorite'}
  // ];
  final List<Widget> _page = [
    const CategoriesScreen(),
    const FaveroiteScreen(),
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      drawer: const MainDrawer(),
      body: _page[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categorie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categorie')
        ],
      ),
    );

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Category',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.favorite,
    //             ),
    //             text: 'Faveroite',
    //           )
    //         ],
    //       ),
    //     ),
    //     body:
    //         const TabBarView(children: [CategoriesScreen(), FaveroiteScreen()]),
    //   ),
    // );
  }
}
