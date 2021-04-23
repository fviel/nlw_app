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
}