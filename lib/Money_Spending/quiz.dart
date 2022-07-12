import 'package:flutter/material.dart';
import 'question_text.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);
  final List<Map<String, Object>> questions;
  final VoidCallback answerQuestion;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionText(
            question: questions[questionIndex]['QuestionText'] as String),
        ...(questions[questionIndex]["QuestionText"]
                as List<Map<String, Object>>)
            //as List
            .map((answer) {
          return AnswerPage(
            selectedHandeler: answerQuestion,
            newText: answer['text'] as String,
          );
        }).toList(),
      ],
    );
  }
}
