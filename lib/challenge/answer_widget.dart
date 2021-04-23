import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';

class AnswerWidget extends StatelessWidget {
  final String titulo;
  bool isRight = false;
  bool isSelected = false;

  AnswerWidget(this.titulo, this.isRight, this.isSelected);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(
            color: isSelected ? _selectedBorderCardRight : AppColors.border,
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
                        color: isSelected ? _selectedBorderRight : AppColors.white,
                    ),
                ),
                color: isSelected ? _selectedColorRight : AppColors.white,
              ),
              child: Center(
                child: Icon(
                  isSelected ? _selectedIconRight : Icons.check,
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
