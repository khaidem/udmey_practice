import 'package:flutter/material.dart';
import 'package:practice_app/ShoppingApp/Logic/order.provider.dart';
import 'package:practice_app/ShoppingApp/widgets/drawer.widget.dart';
import 'package:practice_app/ShoppingApp/widgets/order_items.widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

// ** we are not using intState when using Future builder */
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<OrderProvider>(context, listen: false).fetchOrder();
      setState(
        () {
          _isLoading = false;
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    print('builder Order');

    return Scaffold(
      appBar: AppBar(
        title: const Text(' Your order'),
      ),
      drawer: const DrawerWidget(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) =>
                  OrderItemsWidget(orderItem: orderData.orders[i])),
    );
  }
}

//** Using Future Builder Widget */
// class OrderScreen extends StatelessWidget {
//   const OrderScreen({Key? key}) : super(key: key);
//   static const routeName = '/orders';

//   @override
//   Widget build(BuildContext context) {
//     print('building order');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Order'),
//       ),
//       body: FutureBuilder(
//           future:
//               Provider.of<OrderProvider>(context, listen: false).fetchOrder(),
//           builder: (cxt, snapshotData) {
//             if (snapshotData.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             } else if (snapshotData.error != null) {
//               return const Center(
//                 child: Text('Something went wrong'),
//               );
//             } else {
//               return Consumer<OrderProvider>(
//                 builder: (ctx, orderData, child) => ListView.builder(
//                     itemCount: orderData.orders.length,
//                     itemBuilder: (ctx, i) =>
//                         OrderItemsWidget(orderItem: orderData.orders[i])),
//               );
//             }
//           }),
//     );
//   }
// }

/// *** Better way of using FutureBuilder Widget
/// * when some app in this widget cause the build method to run  again, some
/// * overState your managing or anything like that. Then fetch and set order would
/// * of course also be re executed. Because build run again, the entire code run again,
/// * this of course mean that a new future would be obtained here. if there is no reason to fetch
/// * again  the above code will not effect any problem here , since we have no other
/// * state changing logic in this widget here.

/// * if we have a scenario that a widget could be rebuild and we don't want fetch
/// * new order just because something else changed, then using this approach is better.

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({Key? key}) : super(key: key);
//   static const routeName = '/orders';

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   Future? _orderFuture;
//   Future _obtainOrdersFunction() {
//     return Provider.of<OrderProvider>(context, listen: false).fetchOrder();
//   }

//   @override
//   void initState() {
//     _orderFuture = _obtainOrdersFunction();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('building order');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Order'),
//       ),
//       body: FutureBuilder(
//         future: _orderFuture,
//         builder: (cxt, snapshotData) {
//           if (snapshotData.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else if (snapshotData.error != null) {
//             return const Center(
//               child: Text('Something went wrong'),
//             );
//           } else {
//             return Consumer<OrderProvider>(
//               builder: (ctx, orderData, child) => ListView.builder(
//                   itemCount: orderData.orders.length,
//                   itemBuilder: (ctx, i) =>
//                       OrderItemsWidget(orderItem: orderData.orders[i])),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
