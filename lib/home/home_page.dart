import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/quiz_widget.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/entities/quiz.dart';

// import 'package:nlw_app/entities/quiz.dart';
// import 'package:nlw_app/entities/user.dart';
import 'package:nlw_app/home/home_controller.dart';
import 'package:nlw_app/home/home_state.dart';
import 'package:nlw_app/widgets/appbar/app_bar.dart';
import 'package:nlw_app/widgets/levelbutton/level_button_widget.dart';
import 'package:nlw_app/widgets/quiz_card/quiz_card_widget.dart';

import 'package:nlw_app/core/app_images.dart';
import 'package:nlw_app/entities/answer.dart';
import 'package:nlw_app/entities/question.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = new HomeController();
  var quizzes = [
    Quiz(
        title: "NLW5 Flutter",
        image: AppImages.blocks,
        level: Level.facil,
        questions: [
          Question(title: "Qual a linguagem do flutter?", answers: [
            Answer(title: "Java", isRight: false),
            Answer(title: "Dart", isRight: true),
            Answer(title: "C", isRight: false),
            Answer(title: "Kotlin", isRight: false),
          ]),
        ]),
    Quiz(
        title: "NLW5 Flutter",
        image: AppImages.blocks,
        level: Level.facil,
        questions: [
          Question(title: "Qual a linguagem do flutter?", answers: [
            Answer(title: "Java", isRight: false),
            Answer(title: "Dart", isRight: true),
            Answer(title: "C", isRight: false),
            Answer(title: "Kotlin", isRight: false),
          ]),
        ]),
  ];

  /// executa como se fosse a contrutora
  @override
  void initState() {
    super.initState();
    //coloquei dentro do setState, pois somente irá renderizar a tela após o evento ser completado

    controller.getUser();
    controller.getQuizzes();
      controller.stateNotifier.addListener(() {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucesso) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user),
        body: Column(
          children: [
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget("Fácil"),
                  LevelButtonWidget("Médio"),
                  LevelButtonWidget("Difícil"),
                  LevelButtonWidget("Perito"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.count(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  children: controller.quizzes
                      .map((e) => QuizCardWidget(
                          title: e.title,
                          image: e.image,
                          questionAnswered: e.questionAnswered,
                          totalQuestions: e.questions.length))
                      .toList(),

                  // QuizCardWidget(
                  //   title: controller.getQuizzes()[0].title,
                  //   image: controller.getQuizzes()[0].image,
                  //   answeredQuestions: controller.getQuizzes()[0].questionAnswered,
                  //   totalQuestions: controller.getQuizzes()[0].questions.length,
                  // )
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 16,
          color: Colors.grey[100],
          child: Center(
            child: Text(
              "Em desenvolvimento",
              style: TextStyle(
                fontSize: 10,
                color: Colors.blueGrey[100],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.darkGreen,
            ),
          ),
        ),
      );
    }
  }
}
