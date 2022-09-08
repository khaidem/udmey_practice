import 'package:flutter/material.dart';

class ForgotPassowrd extends StatefulWidget {
  const ForgotPassowrd({Key? key}) : super(key: key);

  @override
  State<ForgotPassowrd> createState() => _ForgotPassowrdState();
}

class _ForgotPassowrdState extends State<ForgotPassowrd> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ForgotPassowrd'),
      ),
    );
  }
}
