import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.totalScore,
  }) : super(key: key);

  final int totalScore;

  String get resultScore {
    String resultnew;
    if (totalScore <= 12) {
      resultnew = 'you are awsome';
    } else if (totalScore <= 10) {
      resultnew = 'Prity like';
    } else if (totalScore <= 16) {
      resultnew = 'fail';
    } else {
      return 'your are bad';
    }
    return resultnew;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(resultScore),
    );
  }
}
