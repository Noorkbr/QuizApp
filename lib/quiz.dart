import 'package:flutter/material.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questions[questionIndex].questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        ...(questions[questionIndex].answers as List<Map<String, Object>>).map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['score']),
            child: Text(answer['text'] as String),
          );
        }).toList()
      ],
    );
  }
}