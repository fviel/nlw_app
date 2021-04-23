import 'dart:convert';

class User{
  String name = "Anônimo";
  String photoUrl = "";
  int score = 0;

  User({
    this.name,
    this.photoUrl,
    this.score
  });

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  Map<String, dynamic> toMap(){
    return{
      'name':name,
      'photoUrl':photoUrl,
      'score':score,
    };
  }

  ///precisei fazer na mão o toMap e fromMap,
  ///eles seriam a interface com o BD
  ///pois o sqlite somente responde json
  factory User.fromMap(Map<String, dynamic> map){
    return User(
    name: map['name'],
    photoUrl: map['photoUrl'],
    score: map['score'],
    );
  }

  ///precisei importar o dart converter pra isso funcionar, senão
  ///ele não entende quem é 'json'
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}