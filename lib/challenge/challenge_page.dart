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

  //pageController é do próprio flutter
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    //adiciona o listener para o currentPage, mas isto iria rebuildar toda a telaa, e não precisa.
    //então adicionei um ValueListenableBuilder para rebuildar somente um trecho dela,
    //esse elemento fica escutando as alterações no notifier currentPage
    // controller.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });

    //adiciona listener do pageControoler, pra atualizar esta tela sempre que trocada a página
    //sempre que ocorrer um evento de swipe, serei notificado
    pageController.addListener(() {
      setState(() {
        ///seta no currentPage qual é a página atual em int
        /////somei 1, pois a contagem começa em 1
        controller.currentPage = pageController.page.toInt() + 1;
        print('opa, mudou de página');
      });
    });
  }

  ///Para poder vizualizar os dados que estão na classe acima, eu podia usar um contrutor, ou o comando widget.
  //_ChallengePageState(questions);

  void nextPage(){
    pageController.nextPage(
        duration: Duration(milliseconds: 600),
        curve: Curves.decelerate,
    );
  }

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
                  icon: Icon(Icons.arrow_back)
              ),


              ValueListenableBuilder<int>(
                //valueListenable é o que ele vai ouvir
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) =>
                  QuestionIndicatorWidget(
                  currentPage: controller.currentPageNotifier.value,
                      length: widget.questions.length),
              ),

            ],
          ),
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      //   child: Column(
      //     children: [
      //       ///usando o comando widget, consigo acessar os membros da classe deste widget
      //       QuizWidget(question: widget.questions[0]),
      //       // AnswerWidget("Estudando, ué", true, true),
      //     ],
      //   ),
      // ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: widget.questions.map((q) => QuizWidget(question: q, onChange: () {nextPage();})).toList(),

        ///se eu colocar dentro de [], preciso usar o ...
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
                      nextPage();
                      print("clicou em pular");
                    },
                  )),
              // SizedBox(
              //   width: 7,
              // ),
              // Expanded(
              //     child: NextButtonWidget.green(
              //       label: 'Confirmar',
              //       onTap: () {
              //         print("clicou em confirmar");
              //       },
              //     )
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
