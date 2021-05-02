import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/widgets/chart/chart_widget.dart';
import 'package:nlw_app/widgets/chart/chart_widget_animado.dart';

class ScoreCardWidget extends StatelessWidget {
  final double value;
  ScoreCardWidget({@required this.value});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width:24),
            Expanded(
              flex: 1,
              //child: ChartWidget(),
              child: ChartWidgetAnimado(value: 75.4),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vamos começar?",
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      "Complete os desafios e avance em conhecimento",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width:24),
          ],
        ),
      ),
    );
  }
}
