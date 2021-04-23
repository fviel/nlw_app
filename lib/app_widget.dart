import 'package:nlw_app/challenge/challenge_page.dart';
import 'package:nlw_app/home/home_page.dart';
import 'package:nlw_app/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      //home: HomePage(),
      home: ChallengePage(),
    );
  }
}
