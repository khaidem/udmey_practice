import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/logic.dart';
import 'package:practice_app/ShoppingApp/screen/badge.screen.dart';
import 'package:practice_app/ShoppingApp/screen/cart.screen.dart';
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
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //** These should not work here simply because the widget is not fully
    //** wired up with everything here  */ */
    // Provider.of<ProductsProvider>(context).fetchAndSetProducts();
    //** we use Future delayed here ,which is a helper constructor, to build a new
    //** future , there you  add a duration and I'll use duration Zero to basically add
    //** no delay and then you can add a then block and in that function here
    //** you could now actually reach out to your provider and do that fetching, so
    //** could do that here know the value we are getting  and we would be fine
    //** and even thought it is technically also execute immediately because we have zero
    //** duration until this code run, so this simply a helper constructor which crate a
    //** future which execute than after this duration passed */  */  */ */  */ */ */ */

    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<ProductsProvider>(context).fetchAndSetProducts();
    // });

    super.initState();
  }

  //** Another method for fetching data after widget fully loaded
  //** initState ,run more often multiple times and not just when this gets created
  //** so when using these approach, we should have another helper var or property like isInit */
  @override
  void didChangeDependencies() {
    //* If we run this first time basically and only execute some code if that true and
    //** isInit to false thereafter, so that this never run again and then we can put code */
    // */
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductsProvider>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductGridWidget(
              showFavorite: _showOnlyFavorite,
            ),
    );
  }
}
