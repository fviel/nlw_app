import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/answer_widget.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/entities/question.dart';

class QuizWidget extends StatefulWidget {
  final Question question;
  QuizWidget({this.question});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {

  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.question.title,
            style: AppTextStyles.heading),
          ),
          SizedBox(height: 24),

          //3. ABORDAGEM TOSCA COM FOR, MAS OK
          for(var i =0; i <widget.question.answers.length ; i++)
            AnswerWidget.answer(
                answer: widget.question.answers[i],
                isSelected: indexSelected == i, //faz um teste
                onTap: () {
                  indexSelected = i;
                  setState(() {

                  });
                },
            ),
            //AnswerWidget(titulo:widget.question.answers[i].title, isRight:widget.question.answers[i].isRight, isSelected:false),


          //2. ABORDAGEM COM MAP PARA MOSTRAR OS ELEMENTOS
          ///Aqui, tenho uma lista (o matp.tolist()) dentro d euma lista(o children), pra resolver, usar o operador 'squid' que são os ...
          //...widget.question.answers.map((q) => AnswerWidget(titulo:q.title, isRight:q.isRight, isSelected:false),).toList(),

          //1. ABORDAGEM ESTÁTICA PARA MONTAR OS ELEMENTOS
          // AnswerWidget("right: false, selected: false", false, false),
          // AnswerWidget("right: true, selected: false", true, false),
          // AnswerWidget("right: false, selected: true", false, true),
          // AnswerWidget("right: true, selected: true", true, true),

        ],
      ),
    );
  }
}
