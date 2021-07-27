import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  final String text;
  final Function()? onTap;

  NumberText({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DefaultContainer(
        blurRadius: 18,
        offset: Offset(0, 10),
        borderRadius: 19,
        child: TextButton(
          style: TextButton.styleFrom(
            fixedSize: Size(
              SizeConfig().scaleWidth(71),
              SizeConfig().scaleHeight(71),
            ),
          ),
          onPressed: null,
          child: BudgetAppText(
            text: text,
            fontSize: SizeConfig().scaleTextFont(23),
            fontWeight: FontWeight.bold,
            textColor: AppColors.APP_PRIMARY_COLOR,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}

/*
*
* Container(
      height: SizeConfig().scaleHeight(71),
      width: SizeConfig().scaleWidth(71),
      clipBehavior: Clip.antiAlias,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
              color: AppColors.DISABLED_COLOR.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 5))
        ],
      ),
      child: BudgetAppText(
        text: text,
        fontSize: 23,
        fontWeight: FontWeight.bold,
        textColor: AppColors.APP_PRIMARY_COLOR,
      ),
    );
*
* */
