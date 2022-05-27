import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    if(resultScore <= 8){
      resultText = 'You are awesome';
    } else if(resultScore <= 12){
      resultText = 'Pretty Good';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetHandler, child: Text('Reset the quiz'), textColor: Colors.blue,)
        ],
      ),
    );
  }
}
