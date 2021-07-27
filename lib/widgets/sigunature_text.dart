import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/material.dart';

class SignatureText extends StatelessWidget {
  final String text;
  final double bottomSpace;
  final FontWeight fontWeight;
  final Color textColor;

  SignatureText({
    required this.text,
    required this.bottomSpace,
    required this.fontWeight,
    this.textColor = AppColors.APP_DARK_PRIMARY_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: SizeConfig().scaleHeight(bottomSpace),
      // bottom: 20,
      child: BudgetAppText(
        text: text,
        textAlign: TextAlign.center,
        fontWeight: fontWeight, //LIGHT
        textColor: textColor,
      ),
    );
  }
}
