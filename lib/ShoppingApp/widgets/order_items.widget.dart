import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_app/ShoppingApp/Logic/order.provider.dart';

class OrderItemsWidget extends StatefulWidget {
  const OrderItemsWidget({Key? key, required this.orderItem}) : super(key: key);
  final OrderItem orderItem;

  @override
  State<OrderItemsWidget> createState() => _OrderItemsWidgetState();
}

class _OrderItemsWidgetState extends State<OrderItemsWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
          children: [
        ListTile(
          title: Text('\$${widget.orderItem.price}'),
          subtitle: Text(
            DateFormat('dd MM yyyy hr:mm ').format(widget.orderItem.dateTime),
          ),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  ///** with the ! mark if it currently true , we set it to false , if it false, when it is true setState work   */
                  expanded = !expanded;
                });
              },
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more)),
        ),
        if (expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.orderItem.cartProduct.length * 20 + 10, 2000),
            //** when we want data form widget and Iterable in listView don't use [] in children */
            child: ListView(
                children: widget.orderItem.cartProduct
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${e.price}x \$${e.quantity}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                    .toList()),
          ),
      ].toList()),
    );
  }
}
