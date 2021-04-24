//import 'package:nlw_app/core/app_colors.dart';
import 'dart:convert';

import 'package:nlw_app/entities/question.dart';

class Quiz {
  final String title;
  final List<Question> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  Quiz({this.title, this.questions, this.questionAnswered, this.image, this.level});

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
    return Quiz(
      title: map['title'],
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map["level"].toString().parse,
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

//faz uma extension no objeto String, de forma que ao receber uma string, devolve um enum
extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this];
}

//faz uma extension no enum, de forma que devolva uma string caso receba um valor de enum
extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificil: "dificil",
    Level.perito: "perito",
      }[this];
}
