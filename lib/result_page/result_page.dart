import 'package:flutter/material.dart';
import 'package:nlw_app/core/app_text_styles.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Parabéns",
              style: AppTextStyles.heading40,
            ),
            Text(
              "Parabéns",
              style: AppTextStyles.heading40,
            ),
            Text(
              "Parabéns",
              style: AppTextStyles.heading40,
            ),
          ],
        ),
      ),
    );
  }
}
