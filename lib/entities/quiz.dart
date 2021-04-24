//import 'package:nlw_app/core/app_colors.dart';
import 'dart:convert';

import 'package:nlw_app/entities/question.dart';

class Quiz {
  final String title;
  final List<Question> questions;
  int questionAnswered;
  final String image;
  final Level level;

  Quiz({this.title, this.questions, this.image, this.level}) {
    this.questionAnswered = 0;
  }

  Quiz.comQtdRespondidas(
      {this.title, this.questions, questionAnswered, this.image, this.level});

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions?.map((x) => x.toMap())?.toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz.comQtdRespondidas(
      title: map['title'],
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map["level"].parse,
    );
  }

  ///precisei importar o dart converter pra isso funcionar, senão
  ///ele não entende quem é 'json'
  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));
}

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

///

//faz o parse para o json
extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this];
}

extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito",
      }[this];
}
