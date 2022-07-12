import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/auth.provider.dart';
import 'package:practice_app/ShoppingApp/example/extract_arguments_screen.dart';

import 'package:practice_app/ShoppingApp/screen/auth_screen.dart';
import 'package:practice_app/ShoppingApp/screen/edit_product.screen.dart';
import 'package:practice_app/ShoppingApp/screen/user_product.screen.dart';
import 'package:provider/provider.dart';

import '../shopping.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),

        //** How to token out of auth into here  */
        ChangeNotifierProxyProvider<AuthProvider, ProductsProvider>(
          create: (_) => ProductsProvider(
            '',
            '',
            [],
          ),
          update: (context, auth, previousProduct) => ProductsProvider(
            auth.token,
            auth.userId,
            previousProduct == null ? [] : previousProduct.items,
          ),
        ),

        // ChangeNotifierProvider(
        //   create: (context) => ProductsProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, OrderProvider>(
            create: (_) => OrderProvider(
                  '',
                  '',
                  [],
                ),
            update: (context, auth, previousProduct) => OrderProvider(
                auth.token!,
                auth.userId,
                previousProduct == null ? [] : previousProduct.orders)),
        // ChangeNotifierProvider(
        //   create: (context) => OrderProvider(),
        // ),
      ],
      child: Consumer<AuthProvider>(
        builder: (cxt, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primaryColor: Colors.purple,
            fontFamily: 'Poppins',
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
          ),
          debugShowCheckedModeBanner: false,

          //checking for auth or not
          // auth.isAuth ? const ProductScreen() : const AuthScreen(),
          home: auth.isAuth ? const ProductScreen() : const AuthScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrderScreen.routeName: (context) => const OrderScreen(),
            UserProductScreen.routeName: (context) => const UserProductScreen(),
            EditProductScreen.routeName: (context) => const EditProductScreen(),
            ExtractArgumentsScreen.routeName: (context) =>
                const ExtractArgumentsScreen(),
            AuthScreen.routeName: (context) => const AuthScreen(),
          },
        ),
      ),
    );
  }
}
