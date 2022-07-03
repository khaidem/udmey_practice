import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:practice_app/ShoppingApp/screen/badge.screen.dart';
import 'package:practice_app/ShoppingApp/screen/cart.screen.dart';
import 'package:practice_app/ShoppingApp/widgets/drawer.widget.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

//** Emun are just way of assigning lables to integer  */
enum FilterOption {
  favorite,
  all,
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    //* when we filter here in our provider class can often be a problem
    //* because it really an information  that belong  to a single widget
    //* and not into  the global app-wide state */
    // final f = Provider.of<ProductsProvider>(context, listen: false);

    //* ---- For using other widget pass data use change stateless to statefull widget

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption fd) {
              setState(() {
                if (fd == FilterOption.favorite) {
                  log('favorite');
                  // f.showFavoriteonly();
                  _showOnlyFavorite = true;
                } else {
                  log('All');
                  // f.showAll();
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('only Favorite'),
                value: FilterOption.favorite,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.all,
              )
            ],
          ),
          //** Only need these bottom not intire widghet we use consumer */
          //** IconButtom will not rebuild when my cart change because  it defined
          //*  outside of builder function */
          Consumer<CartProvider>(
            builder: (cxt, cartProvider, child) => BadgeScreen(
                child: child!, value: cartProvider.itemCount.toString()),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart_outlined)),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: ProductGridWidget(
        showFavorite: _showOnlyFavorite,
      ),
    );
  }
}
