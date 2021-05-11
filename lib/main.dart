import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/foundation/constants.dart';

import 'Quiz.dart';
import 'Result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var _userScore = 0;
  var _questionList = [
    {
      'question': 'iki opo iki ?',
      'answers': [
        {'text': 'MATARAM IS BLUE', 'score': 10},
        {'text': 'Mataram is Red', 'score': 0}
      ],
      'audioPath': 'mataramISBLUE'
    },
    {
      'question': 'Pasopati?',
      'answers': [
        {'text': 'ANJING', 'score': 10},
        {'text': 'cat', 'score': 0},
        {'text': 'Snake', 'score': 0}
      ],
      'audioPath': 'pasopati'
    },
    {
      'question': 'aku ?',
      'answers': [
        {'text': 'Kapiten', 'score': 0},
        {'text': 'Suzuran', 'score': 0},
        {'text': 'Batosai', 'score': 10}
      ],
      'audioPath': 'batosai'
    },
    {
      'question': 'are you done ? ',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 0},
        {'text': 'Ho\'oh', 'score': 10}
      ],
      'audioPath': 'hooh'
    }
  ];
  var _questionIndex = 0;
  void _answerQuestion(int score, var audioPath) {
    setState(() {
      _questionIndex += 1;
      _userScore += score;
    });
    print(_questionIndex);
    print(audioPath);
    if (score == 10) audioCache.play('../assets/audio/${audioPath}.mp3');
  }

  void _resetQuestion() {
    setState(() {
      _questionIndex = 0;
      _userScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tes Flutter!'),
        ),
        body: _questionIndex < _questionList.length
            ? Quiz(
                questionList: _questionList,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_userScore, _resetQuestion),
      ),
    );
  }
}
