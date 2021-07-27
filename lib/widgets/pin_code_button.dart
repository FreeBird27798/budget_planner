import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'budget_app_text.dart';

class PinCodeButton extends StatelessWidget {
  final String? number;
  final IconData? icon;
  final double marginEnd;
  final Color color;
  final void Function() onPressed;

  PinCodeButton({
    this.number,
    this.icon,
    this.color = Colors.white,
    this.marginEnd = 0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: SizeConfig().scaleWidth(71),
      height: SizeConfig().scaleHeight(71),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: AppColors.EX_IN_BOX_SHADOW_COLOR,
            blurRadius: 18,
          )
        ],
      ),
      child: number != null
          ? TextButton(
              onPressed: onPressed,
              child: BudgetAppText(
                text: number!,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                textColor: AppColors.APP_PRIMARY_COLOR,
                letterSpacing: 0,
              ),
            )
          : TextButton.icon(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: Colors.white,
                size: SizeConfig().scaleWidth(24),
              ),
              label: Text(''),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
              ),
            ),
    );
  }
}
