import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_gradients.dart';
import 'package:nlw_app/core/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

