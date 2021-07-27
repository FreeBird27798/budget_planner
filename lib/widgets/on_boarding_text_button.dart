import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class OnBoardingTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double fontSize;

  OnBoardingTextButton(
      {required this.text, this.onPressed, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: BudgetAppText(
        text: text,
        fontWeight: FontWeight.w400,
        textColor: AppColors.LIGHT_TEXT_COLOR,
        fontSize: fontSize,
      ),
      onPressed: onPressed,
    );
  }
}
