import 'package:flutter/material.dart';
import 'package:nlw_app/widgets/questionindicator/question_indicator_widget.dart';
import 'package:nlw_app/challenge/quiz_widget.dart';
import 'package:nlw_app/challenge/answer_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top:true,
            child: QuestionIndicatorWidget(),
        ),
      ),
      body: Column(
        children: [
          QuizWidget("Qual a melhor forma de estudar?"),
          AnswerWidget("Estudando, ué", true, true),
        ],
      ),
    );
  }
}
