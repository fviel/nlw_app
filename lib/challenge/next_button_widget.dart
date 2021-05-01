import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_app/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  final VoidCallback onTap;

  NextButtonWidget.green({String this.label, this.onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor =AppColors.darkGreen;

  NextButtonWidget.white({String this.label, this.onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor =AppColors.border;

  NextButtonWidget.purple({String this.label, this.onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor =AppColors.border;

  NextButtonWidget({this.label, this.backgroundColor, this.fontColor, this.borderColor,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding:EdgeInsets.all(8),
      height: 48,
      child: TextButton(
          style: ButtonStyle(
            //backgroundColor: AppColors.darkGreen,
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
              ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: AppColors.border,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: fontColor,
            ),
          )),
    );
  }
}
