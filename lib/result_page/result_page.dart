import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nlw_app/challenge/next_button_widget.dart';
import 'package:nlw_app/core/app_images.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/home/home_page.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy),
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text.rich(
                    TextSpan(
                        text: 'Você concluiu ',
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: '\nNOME DO CURSO ',
                              style: AppTextStyles.bodyBold),
                          TextSpan(
                              text: '\ncom X de Y acertos.',
                              style: AppTextStyles.body),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            print('compartilhar');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Voltar',
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
