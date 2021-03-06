import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/core/core.dart';

// ignore: must_be_immutable
class QuizCardWidget extends StatelessWidget {
   String title;
   String image;
   int questionAnswered;
   int totalQuestions;
   final VoidCallback onTap;

   ///Construtor com validações para evitar erros de cálculos de progresso
  QuizCardWidget({this.title, this.image, this.questionAnswered, this.totalQuestions, this.onTap}){
    if(title == null){
      title = "Título";
    }
    if(image == null){
      image = AppImages.blocks;
    }
    if(questionAnswered == null || questionAnswered < 0){
      questionAnswered = 0;
    }
    if(totalQuestions == null || totalQuestions < 1){
      totalQuestions = 0;
    }
  }

  double _calcularProgresso(){
    //validação para evitar divisão por 0 ou inválida
    if(totalQuestions == null || totalQuestions < 1){
      return 0.0;
    }
    return questionAnswered/totalQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  child: Text('$questionAnswered de $totalQuestions', style: AppTextStyles.body11),
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
      ),
    );
  }
}
