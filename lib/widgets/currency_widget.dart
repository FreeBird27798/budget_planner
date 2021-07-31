import 'package:flutter/material.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';

class CurrencyItem extends StatelessWidget {
  final bool isSelected;
  final String name;



  CurrencyItem({
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      // color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.3),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsetsDirectional.only(
        top: SizeConfig().scaleHeight(24),
        bottom: SizeConfig().scaleHeight(24),
        start: SizeConfig().scaleWidth(12),
        end: SizeConfig().scaleWidth(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          BudgetAppText(
            text: name,
            fontWeight: FontWeight.w500,
          ),
          Spacer(),
          Icon(
            isSelected ? Icons.check : null,
            color: AppColors.APP_PRIMARY_COLOR,
          ),
        ],
      ),
    );
  }
}
