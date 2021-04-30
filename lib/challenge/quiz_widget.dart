import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/answer_widget.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/entities/question.dart';

class QuizWidget extends StatelessWidget {
  final Question question;
  QuizWidget({this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Foo",
          style: AppTextStyles.heading),
          SizedBox(height: 24),

          ///Aqui, tenho uma lista (o matp.tolist()) dentro d euma lista(o children), pra resolver, usar o operador 'squid' que são os ...
          ...question.answers.map((q) => AnswerWidget(titulo:q.title, isRight:q.isRight, isSelected:false),).toList(),

          // AnswerWidget("right: false, selected: false", false, false),
          // AnswerWidget("right: true, selected: false", true, false),
          // AnswerWidget("right: false, selected: true", false, true),
          // AnswerWidget("right: true, selected: true", true, true),

        ],
      ),
    );
  }
}
