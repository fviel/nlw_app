import 'package:flutter/material.dart';
import 'package:nlw_app/core/core.dart';

/// APPBAR é algo especial, tem algusn elementos que não podem ser trocados por um outro widget,
/// então tive que fazer o extend de um preferedSize para contornar este problema
class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            child: Row(
              children: <Widget>[
                //Usei o Text.rich para não ter que usar um monte de componentes de text
                Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                          text: "Fernando", style: AppTextStyles.titleBold),
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
                          "https://avatars.githubusercontent.com/u/16632331?s=400&u=da60c58af0ae4d81bb509c6a1c592132c6325e0b&v=4"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
