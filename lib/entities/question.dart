import 'dart:convert';

import 'package:nlw_app/entities/answer.dart';

class Question{
  final String title;
  final List<Answer> answers;

  ///fiz o assert para garantir que cada question terá 4 respostas
  Question({
    this.title,
    this.answers
  }) : assert(
    answers.length == 4,
  );


  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  Map<String, dynamic> toMap(){
    return{
      'title':title,
      'answers':answers?.map((x) => x.toMap())?.toList(),
    };
  }

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  factory Question.fromMap(Map<String, dynamic> map){
    return Question(
      title: map['title'],
      answers: List<Answer>.from(
          map['answers']?.map((x) => Answer.fromMap(x))),
    );
  }

  ///precisei importar o dart converter pra isso funcionar, senão
  ///ele não entende quem é 'json'
  String toJson() => json.encode(toMap());
  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));
}