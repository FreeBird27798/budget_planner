import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class BudgetAppText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double letterSpacing;
  final FontStyle fontStyle;
  final TextAlign textAlign;

  // final double height;

  BudgetAppText({
    required this.text,
    this.textColor = AppColors.TEXT_COLOR,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Montserrat',
    this.letterSpacing = 0.06,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    // this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: SizeConfig().scaleTextFont(fontSize),
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,

        // height: height,
      ),
    );
  }
}
