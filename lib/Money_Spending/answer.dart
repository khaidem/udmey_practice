import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage(
      {Key? key, required this.selectedHandeler, required this.newText})
      : super(key: key);
  final VoidCallback selectedHandeler;
  final String newText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: selectedHandeler, child: Text(newText)),
    );
  }
}
