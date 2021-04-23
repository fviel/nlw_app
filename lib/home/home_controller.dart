import 'package:nlw_app/core/app_images.dart';
import 'package:nlw_app/entities/answer.dart';
import 'package:nlw_app/entities/question.dart';
import 'package:nlw_app/entities/quiz.dart';
import 'package:nlw_app/entities/user.dart';
import 'package:nlw_app/home/home_state.dart';

class HomeController {
  HomeState state = HomeState.empty;

  User user;
  List<Quiz> quizzes;

  User getUser() {
    this.user = new User(
        name: "Fernando",
        score: 0,
        photoUrl:
            "https://avatars.githubusercontent.com/u/16632331?s=400&u=da60c58af0ae4d81bb509c6a1c592132c6325e0b&v=4");
    return this.user;
  }

  List<Quiz> getQuizzes() {
    this.quizzes = [
      Quiz(
          title: "NLW5 Flutter",
          image: AppImages.blocks,
          level: Level.facil,
          questions: [
        Question(
            title: "Qual a linguagem do flutter?",
            answers: [
                Answer(title: "Java", isRight: false),
                Answer(title: "Dart", isRight: true),
                Answer(title: "C", isRight: false),
                Answer(title: "Kotlin", isRight: false),
              ]
        ),
      ])
    ];

    return this.quizzes;
  }
}
