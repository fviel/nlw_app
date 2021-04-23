import 'package:flutter/material.dart';
import 'package:nlw_app/core/core.dart';
import 'package:nlw_app/entities/user.dart';
import 'package:nlw_app/widgets/scorecard/score_card_widget.dart';

/// APPBAR é algo especial, tem algusn elementos que não podem ser trocados por um outro widget,
/// então tive que fazer o extend de um preferedSize para contornar este problema
class AppBarWidget extends PreferredSize {
  final User user;

  AppBarWidget({this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Usei o Text.rich para não ter que usar um monte de componentes de text
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold),
                          ],
                        ),
                      ),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                user.photoUrl),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///Alinha o ScoreCard pra baixo do outro elemento, mesmo dentro da stack
                Align(alignment: Alignment(0, 1), child: ScoreCardWidget()),
              ],
            ),
          ),
        );
}
