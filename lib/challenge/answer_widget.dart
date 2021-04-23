import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';

class AnswerWidget extends StatelessWidget {
  final String titulo;
  final bool isRight;
  final bool isSelected;

  AnswerWidget(this.titulo, this.isRight, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(
            color: AppColors.border,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //coloquei o expanded, para que o texto possa quebrar a linha
            Expanded(
              child: Text(
                  titulo, 
                  style: AppTextStyles.body
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(
                    BorderSide(
                        color:AppColors.border
                    ),
                ),
                color: AppColors.darkGreen,
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
