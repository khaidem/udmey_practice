import 'package:flutter/material.dart';
import 'package:practice_app/Money_Spending/quiz.dart';
import 'package:practice_app/Money_Spending/result.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "QuestionText": 'what\'s  your favorite color',
      'Answer': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Black', 'score': 50},
      ]
    },
    {
      "QuestionText": ' what\'s your favorite animal',
      'Answer': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Tiger', 'score': 2},
        {'text': 'Hui', 'score': 9},
      ]
    },
    {
      "QuestionText": ' what\'s your favorite Instructor',
      'Answer': [
        {'text': 'Max', 'score': 100},
        {'text': 'Tom', 'score': 200},
        {'text': 'Blacky', 'score': 500},
      ]
    }
  ];
  var questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < questions.length) {
      print('More Question');
    } else {
      print('No More Question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Question App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: () => _answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore: _totalScore),
      ),
    );
  }
}
