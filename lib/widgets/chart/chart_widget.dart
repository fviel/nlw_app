import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_colors.dart';
import 'package:nlw_app/core/app_text_styles.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      ///O componente de stack permite empilhar widgets, um em cima do outro
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child:CircularProgressIndicator(
                strokeWidth: 10,
                value:.75,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text("75%",
            style: AppTextStyles.heading),
          ),
        ],
      ),
    );
  }
}
