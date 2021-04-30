import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/challenge_controller.dart';
import 'package:nlw_app/challenge/next_button_widget.dart';
import 'package:nlw_app/entities/question.dart';
import 'package:nlw_app/widgets/questionindicator/question_indicator_widget.dart';
import 'package:nlw_app/challenge/quiz_widget.dart';
//import 'package:nlw_app/challenge/answer_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<Question> questions;
  ChallengePage({@required this.questions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = ChallengeController();

    ///Para poder vizualizar os dados que estão na classe acima, eu podia usar um contrutor, ou o comando widget.
  //_ChallengePageState(questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(98),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///O BackButton faz o mesmo que navigator.pop()
              //BackButton(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                      Icons.arrow_back)
              ),
              QuestionIndicatorWidget(currentPage: controller.currentPageNotifier.value, length: widget.questions.length),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          children: [
            ///usando o comando widget, consigo acessar os membros da classe deste widget
            QuizWidget(question: widget.questions[0]),
            // AnswerWidget("Estudando, ué", true, true),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: NextButtonWidget.white(
                label: 'Pular',
                onTap: () {
                  print("clicou em pular");
                },
              )),
              SizedBox(
                width: 7,
              ),
              Expanded(
                  child: NextButtonWidget.green(
                label: 'Confirmar',
                onTap: () {
                  print("clicou em confirmar");
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
