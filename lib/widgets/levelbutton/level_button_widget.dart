import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_app/core/app_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  ///Nessa construtora, fiz um assert do conteúdo de label, pois ele somente
  /// pode ser um daqueles 4, caso contrário irá gerar exceprion
  LevelButtonWidget(this.label) : assert (["Fácil", "Médio", "Difícil","Perito"].contains(label));

  final config = {
    "Fácil":{
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio":{
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil":{
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito":{
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    },
  };

  ///esse método 'get' é uma simplificação, pois poderia ser um método
  /// comum retornando a cor
  Color get color => config[label]['color'];
  Color get borderColor => config[label]['borderColor'];
  Color get fontColor => config[label]['fontColor'];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            ///obtem a cor do get da classe
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
      decoration: BoxDecoration(
        ///obtem a cor de fundo do get da classe
        color: color,
        border: Border.fromBorderSide(
          BorderSide(
            ///obtém a cor da borda do get da classe
            color: borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
