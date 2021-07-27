import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'budget_app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Color textColor;
  final Color backgroundColor;
  final Function()? onPressed;
  final double fontSize;

  AppElevatedButton({
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.letterSpacing = 0.22,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.APP_PRIMARY_COLOR,
    this.onPressed,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BudgetAppText(
        text: text,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        textColor: textColor,
        fontSize: fontSize,
      ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
