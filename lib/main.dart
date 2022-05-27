import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score':10},
        {'text': 'Red', 'score':9},
        {'text': 'Blue', 'score':8},
        {'text': 'Green', 'score':7},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score':6},
        {'text': 'Dog', 'score':4},
        {'text': 'Elaphant', 'score':5},
        {'text': 'Cat', 'score':7},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Mai', 'score':6},
        {'text': 'Gai', 'score':6},
        {'text': 'Tai', 'score':6},
        {'text': 'Lai', 'score':6},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){

    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('We have no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length ?
        Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
        )
            :
        Result(_totalScore, _resetQuiz),
      ),
    );
  }
}






