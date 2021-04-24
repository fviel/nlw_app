import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nlw_app/entities/quiz.dart';
import 'package:nlw_app/entities/user.dart';

class HomeRepository{

  //rootBundle é a ferramenta para ler meus recursos
  Future<User> getUser() async{
    final response = await rootBundle.loadString("/database/user.json");
    final user = User.fromJson(response);
    return user;
  }

  Future<List<Quiz>> getQuizzes() async{
    final response = await rootBundle.loadString("/database/quizzes.json");
    final listQuiz = jsonDecode(response) as List;
    final quizzes = listQuiz.map((e) => Quiz.fromMap(e)).toList();
    return quizzes;
  }
}