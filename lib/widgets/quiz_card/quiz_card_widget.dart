import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/core/core.dart';

// ignore: must_be_immutable
class QuizCardWidget extends StatelessWidget {
   String title;
   String image;
   int answeredQuestions;
   int totalQuestions;

  QuizCardWidget({this.title, this.image, this.answeredQuestions, this.totalQuestions});
  //  QuizCardWidget(){
  //    title = "foo";
  //    image = "dsasds ";
  //    answeredQuestions = 10;
  //    totalQuestions = 100;
  //  }

  double _calcularProgresso(){
    return answeredQuestions/totalQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            color: Colors.white,
            child: Image.asset(image),
          ),
          SizedBox(height: 12),
          Text(
              title,
              style: AppTextStyles.heading15
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('$answeredQuestions de $totalQuestions', style: AppTextStyles.body11),
              ),
              Expanded(
               flex: 2,
                child: LinearProgressIndicator(
                  value: _calcularProgresso(),
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
