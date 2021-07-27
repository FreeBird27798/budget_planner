import 'package:budget_planner/enums.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpenseIncomeCard extends StatelessWidget {
  /// if 1 => Expense, if 0 => Income
  final CategoryType type;
  final Function()? onPressed;
  final bool selected;

  // final Color iconColor;

  ExpenseIncomeCard({
    this.onPressed,
    this.selected = false,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: Container(
          height: SizeConfig().scaleHeight(92),
          // width: SizeConfig().scaleWidth(182),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: selected
                  ? Border.all(
                      // color: iconColor,
                      color: type == CategoryType.Expense
                          ? AppColors.EXPENSES_COLOR
                          : AppColors.INCOMES_COLOR,
                      width: 1)
                  : null,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 14,
                  color: AppColors.EX_IN_BOX_SHADOW_COLOR,
                ),
              ]),

          child: Column(
            children: [
              SizedBox(
                height: SizeConfig().scaleHeight(8),
              ),
              Icon(
                type == CategoryType.Expense
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: type == CategoryType.Expense
                    ? AppColors.EXPENSES_COLOR
                    : AppColors.INCOMES_COLOR,
                // size: SizeConfig().scaleHeight(16),
              ),
              SizedBox(
                height: SizeConfig().scaleHeight(8),
              ),
              Text(type == CategoryType.Expense
                  ? AppLocalizations.of(context)!.expenses
                  : AppLocalizations.of(context)!.incomes),
              SizedBox(
                height: SizeConfig().scaleHeight(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
