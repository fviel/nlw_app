import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw_app/core/app_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  final String texto;

  LevelButtonWidget(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          texto,
          style: GoogleFonts.notoSans(
            color: AppColors.levelButtonTextFacil,
            fontSize: 13,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.levelButtonFacil,
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.levelButtonBorderFacil,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
