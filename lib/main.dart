import 'package:flutter/material.dart';
import 'package:nlw_app/app_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "DevQuiz",
      home: AppWidget(),
    );
  }
}