import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:nlw_app/entities/quiz.dart';
import 'package:nlw_app/entities/user.dart';

class HomeRepository{

  //rootBundle é a ferramenta para ler meus recursos
  Future<User> getUser() async{

      final response = await rootBundle.loadString("assets/database/user.json");
      final user = User.fromJson(response);
      return user;

  }

  Future<List<Quiz>> getQuizzes() async{
    final response = await rootBundle.loadString("assets/database/quizzes.json");
    final listQuiz = jsonDecode(response) as List; //retorna uma lista de json's
    final quizzes = listQuiz.map((e) => Quiz.fromMap(e)).toList(); //para cada json da lista de json's, quye eu chamei de 'e', faz o fromMap, transformando json em objeto
    return quizzes;
  }
}