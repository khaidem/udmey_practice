import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/order.provider.dart';
import 'package:practice_app/ShoppingApp/widgets/drawer.widget.dart';
import 'package:practice_app/ShoppingApp/widgets/order_items.widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Your order'),
      ),
      drawer: const DrawerWidget(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) =>
              OrderItemsWidget(orderItem: orderData.orders[i])),
    );
  }
}
