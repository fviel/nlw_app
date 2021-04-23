import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';
import 'package:nlw_app/core/core.dart';

class QuizCardWidget extends StatelessWidget {
  QuizCardWidget();

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
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 12),
          Text('Gerenciamento de estado', style: AppTextStyles.heading15),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('3 de 10', style: AppTextStyles.body11),
              ),
              Expanded(
               flex: 2,
                child: LinearProgressIndicator(
                  value: 0.3,
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
