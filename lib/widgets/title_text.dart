import 'package:budget_planner/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'budget_app_text.dart';

class TitleText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final double fontSize;
  final double letterSpacing;
  final TextAlign textAlign;

  TitleText({
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.center,
    this.textColor = AppColors.APP_DARK_PRIMARY_COLOR,
    this.fontSize = 20,
    this.letterSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BudgetAppText(
      text: text,
      textAlign: textAlign,
      fontWeight: fontWeight,
      textColor: textColor,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }
}
