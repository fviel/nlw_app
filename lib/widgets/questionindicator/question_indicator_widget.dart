import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_text_styles.dart';

import 'package:nlw_app/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão 04",
                style: AppTextStyles.body,
              ),
              Text(
                "de 10",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(0.3),
        ],
      ),
    );
  }
}
