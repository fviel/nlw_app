import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/entities/answer.dart';

// ignore: must_be_immutable
class AnswerWidget extends StatelessWidget {
  bool isSelected = false;
  final Answer answer;
  final VoidCallback onTap;

  //AnswerWidget({this.title, this.isRight, this.isSelected}): answer=null;
  AnswerWidget.answer({this.answer, this.isSelected, this.onTap});

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
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
                    answer.title,
                    style: isSelected? _selectedTextStyleRight : AppTextStyles.body
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
      ),
    );
  }
}
