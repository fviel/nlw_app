import 'package:flutter/cupertino.dart';
import 'package:nlw_app/entities/quiz.dart';
import 'package:nlw_app/entities/user.dart';
import 'package:nlw_app/home/home_repository.dart';
import 'package:nlw_app/home/home_state.dart';

class HomeController {
  ///ValueNotifier é um recurso do dart para notificar eventos, tipo um observer
  final ValueNotifier<HomeState> stateNotifier =  ValueNotifier<HomeState>(HomeState.empty);

  ///fiz um set pra alterar o valor do state dentro da stateNotifier
  set state(HomeState state) => stateNotifier.value = state;
  ///get para obter o state
  HomeState get state => stateNotifier.value;

  ///Mecanismo que bolei para somente liberar a tela após a carga de todos os recursos
  bool carregouUser = false;
  bool carregouQuizzes = false;
  // _alterarEstadoCarregamento(){
  //   if(carregouUser == true && carregouQuizzes == true){
  //     state = HomeState.sucesso;
  //   }else{
  //     state = HomeState.loading;
  //   }
  // }

  User user;
  List<Quiz> quizzes;
  final repository = new HomeRepository();

  ///SIMULA O SISTEMA INDO BUSCAR ESSES DADOS DE UM WS OU DO BD
  void getUser() async{
    //define que está buscando o estado
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    this.user = await repository.getUser();
    // this.user = new User(
    //     name: "Fernando",
    //     score: 0,
    //     photoUrl:
    //         "https://avatars.githubusercontent.com/u/16632331?s=400&u=da60c58af0ae4d81bb509c6a1c592132c6325e0b&v=4");
    state = HomeState.sucesso;
  }

  ///SIMULA O SISTEMA INDO BUSCAR ESSES DADOS DE UM WS OU DO BD
  void getQuizzes() async{
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    this.quizzes = await repository.getQuizzes();

    state = HomeState.sucesso;

    // this.quizzes = [
    //   Quiz.comQtdRespondidas(
    //       title: "NLW5 Flutter",
    //       image: AppImages.blocks,
    //       questionAnswered: 1,
    //       level: Level.facil,
    //       questions: [
    //     Question(
    //         title: "Qual a linguagem do flutter?",
    //         answers: [
    //             Answer(title: "Java", isRight: false),
    //             Answer(title: "Dart", isRight: true),
    //             Answer(title: "C", isRight: false),
    //             Answer(title: "Kotlin", isRight: false),
    //           ]
    //     ),
    //   ]
    //   )
    // ];
  }
}
