//CurrentPage

import 'package:flutter/foundation.dart';

class ChallengeController{
  //iniciar no valor 1, ou seja, a primeira página recebe o valor 1
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  int qtdRightAnswers = 0;
}