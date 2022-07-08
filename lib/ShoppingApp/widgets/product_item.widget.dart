import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/cart.provider.dart';
import 'package:practice_app/ShoppingApp/screen/product_details.screen.dart';
import 'package:provider/provider.dart';

import '../Logic/product.model.dart';

class ProduuctItemWidget extends StatelessWidget {
  const ProduuctItemWidget({
    Key? key,
  }) : super(key: key);

  //*--------- Using Consumer provider ---
  ///**only listen the change widget
  ///*** Consumer allow us to throw somewhere into our widget tree and the only
  ///*** rebuild the nested childern  */ */ */

  @override
  Widget build(BuildContext context) {
    final d = Provider.of<ProductModel>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    //*Listen to fall use because this widghte is not rebuild if cart changes
    //* tell the cart that added new item , not interested change the cart */

    ///*** this is not a widget but simply a method or a way of  extracting data
    ///*and storing it in varaible it awalys trigger the whole  build
    ///**method*/
    ///
    ///** Go to product_itm.widget.dart */
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsScreen.routeName, arguments: d.id);
          },
          child: Image.network(
            d.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<ProductModel>(
            builder: (ctx, d, child) => IconButton(
              onPressed: () {
                d.toggleFavorite();
              },
              icon: d.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            d.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.add(d.id!, d.price, d.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Added item to cart'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(d.id!);
                      }),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
