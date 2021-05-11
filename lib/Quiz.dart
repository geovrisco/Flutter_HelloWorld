import 'package:flutter/material.dart';
import 'answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questionList,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questionList[questionIndex]['question']),
        ...(questionList[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                () => answerQuestion(
                    answer['score'], questionList[questionIndex]['audioPath']),
                answer['text']))
            .toList()
      ],
    );
  }
}
