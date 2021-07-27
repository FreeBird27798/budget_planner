import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'budget_app_text.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor;
  final double fontSize;

  SubTitleText({
    required this.text,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.textColor = AppColors.LIGHT_TEXT_COLOR,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return BudgetAppText(
      text: text,
      textAlign: textAlign,
      fontWeight: fontWeight,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
