import 'package:flutter/material.dart';
import 'package:practice_app/Money_Spending/transaction_list.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transaction = [
      Transaction(
          id: '100', title: 'Leibi u', amount: 2000, date: DateTime.now()),
      Transaction(
          id: '130', title: 'Panjara', amount: 5000, date: DateTime.now()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Transaction App'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: const Card(
              child: Text('Transaction'),
            ),
          ),
          // Column(children: [transaction.map((e) {return Card(child: Text(e.title),)}).toList()],)
        ],
      ),
    );
  }
}
