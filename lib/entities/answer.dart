import 'dart:convert';

class Answer {
  ///Pelo Flutter 2, se eu colocar ? antes no nome da var, ele pode ser nulo, caso contrário, não pode ser null
  final String title;
  final bool isRight;

  //deixei opcional informar o valor de iRight. Se informar, ok, caso contrário, será sempre false
  Answer({this.title, this.isRight = false});

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      title: map['title'],
      isRight: map['isRight'] ?? false, //só alguma sperguntas possuem o isRight, por isso o operador de isnull (??)
    );
  }

  ///precisei importar o dart converter pra isso funcionar, senão
  ///ele não entende quem é 'json'
  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source));
}
