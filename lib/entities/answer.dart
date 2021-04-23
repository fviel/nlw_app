

class Answer {
  ///Pelo Flutter 2, se eu colocar ? antes no nome da var, ele pode ser nulo, caso contrário, não pode ser null
  final String title;
  final bool isRight;

  //deixei opcional informar o valor de iRight. Se informar, ok, caso contrário, será sempre false
  Answer({
      this.title,
      this.isRight=false
  });


}