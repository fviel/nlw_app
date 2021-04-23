import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  double progresso;

  ProgressIndicatorWidget(this.progresso){
    if (progresso <0){
      progresso = 0;
    }

    if (progresso > 1){
      progresso = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progresso,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
