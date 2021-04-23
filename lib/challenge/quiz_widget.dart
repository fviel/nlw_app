import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/answer_widget.dart';
import 'package:nlw_app/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String titulo;

  QuizWidget(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(titulo,
          style: AppTextStyles.heading),
          SizedBox(height: 24),

          AnswerWidget("right: false, selected: false", false, false),
          AnswerWidget("right: true, selected: false", true, false),
          AnswerWidget("right: false, selected: true", false, true),
          AnswerWidget("right: true, selected: true", true, true),

        ],
      ),
    );
  }
}
