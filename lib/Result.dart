import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resethandler;

  Result(this.score, this.resethandler);

  String get resultPhrase {
    String resultText;
    if (score <= 20) {
      resultText = 'kon pasopati asu';
    } else if (score <= 30) {
      resultText = ' Not Bad';
    } else if (score <= 40) {
      resultText = 'Mataram is indeed BLUE';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'User Score : ${score}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          FlatButton(
            onPressed: resethandler,
            child: Text('Ulangi'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
