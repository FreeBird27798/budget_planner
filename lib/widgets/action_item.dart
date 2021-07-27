import 'package:budget_planner/getx_controllers/action_getx_controller.dart';
import 'package:budget_planner/models/user_action.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  final UserAction action;
  final void Function()? onTap;
  final bool? checked;

  ActionItem({
    required this.action,
    this.checked,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //TODO:Needs To Be implemented
      onTap: (){},
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              end: SizeConfig().scaleWidth(11),
            ),
            height: SizeConfig().scaleHeight(54),
            width: SizeConfig().scaleWidth(54),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.EX_IN_BOX_SHADOW_COLOR,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                action.category.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig().scaleTextFont(15),
                  color: AppColors.APP_DARK_PRIMARY_COLOR,
                ),
              ),
              Visibility(
                visible: action.notes.isNotEmpty,
                child: Text(
                  action.notes,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: SizeConfig().scaleTextFont(15),
                    color: AppColors.LIGHT_TEXT_COLOR,
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig().scaleTextFont(15),
              color: action.expense
                  ? AppColors.EXPENSES_COLOR
                  : AppColors.INCOMES_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  String get amount {
    String currencySymbol = getCurrencySymbol();
    return action.expense
        ? '- $currencySymbol ${action.amount}'
        : '+ $currencySymbol ${action.amount}';
  }

  String getCurrencySymbol() {
    if (action.currencyId == 1) {
      return '₪';
    } else if (action.currencyId == 2) {
      return '\$';
    } else {
      return 'JOD';
    }
  }
}
