//import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/entities/question.dart';

class Quiz {
  final String title;
  final List<Question> questions;
  int questionAnswered;
  final String image;
  final Level level;

  Quiz({
  this.title,
  this.questions,
  this.image,
  this.level
  }){
    this.questionAnswered = 0;
  }

  Quiz.comQtdRespondidas({
    this.title,
    this.questions,
    questionAnswered,
    this.image,
    this.level
  });

}

enum Level {
  facil,
  medio,
  dificil,
  perito,
}
