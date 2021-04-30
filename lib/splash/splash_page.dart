import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_gradients.dart';
import 'package:nlw_app/home/home_page.dart';

class SplashPage extends StatelessWidget {


  // SplashPage(){
  //   //não posso fazer async e await no construtor, por isso tenho que usar o then
  // }

  @override
  Widget build(BuildContext context) {

    //usei o pushReplacement, pois num é pra empilhar tela, é pra substituir
    Future.delayed(Duration(seconds: 1)).then(
          (_) => Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage(),
      )),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          //A Sacada é que defini todos os paths de imagem em strings nessas classes
          child: Image(
              image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}

