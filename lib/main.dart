import 'package:flutter/material.dart';
import 'quiz.dart';
import 'question.dart';
import 'result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final _questions = [
    Question(
      questionText: 'What\'s your favorite color?',
      answers: [
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'Blue', 'score': 5},
        {'text': 'Black', 'score': 1},
      ],
    ),
    Question(
      questionText: 'What\'s your favorite animal?',
      answers: [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 1},
      ],
    ),
    Question(
      questionText: 'Who\'s your favorite instructor?',
      answers: [
        {'text': 'Max', 'score': 5},
        {'text': 'Angela', 'score': 4},
        {'text': 'Colt', 'score': 3},
        {'text': 'Stephen', 'score': 2},
      ],
    ),
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          questions: _questions,
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}