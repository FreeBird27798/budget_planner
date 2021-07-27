import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CircularProgressInfo extends StatelessWidget {
  final double expenses;
  final double balance;

  CircularProgressInfo({
    required this.expenses,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$ ',
              style: TextStyle(
                height: 3,
                fontSize: SizeConfig().scaleTextFont(18),
              ),
            ),
            Text(
              expenses.toString(),
              style: TextStyle(
                fontSize: SizeConfig().scaleTextFont(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          AppLocalizations.of(context)!.spent_today,
          style: TextStyle(
            color: AppColors.LIGHT_TEXT_COLOR,
            fontSize: SizeConfig().scaleTextFont(16.5),
          ),
        ),
        Divider(
          indent: SizeConfig().scaleWidth(33),
          endIndent: SizeConfig().scaleWidth(33),
          height: SizeConfig().scaleHeight(28),
        ),
        Text(
          AppLocalizations.of(context)!.balance_for_today,
          style: TextStyle(
            color: AppColors.LIGHT_TEXT_COLOR,
            fontSize: SizeConfig().scaleTextFont(16.5),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$ ',
              style: TextStyle(
                height: 3,
                fontSize: SizeConfig().scaleTextFont(18),
                color: AppColors.INCOMES_COLOR,
              ),
            ),
            Text(
              balance.toString(),
              style: TextStyle(
                  fontSize: SizeConfig().scaleTextFont(40),
                  fontWeight: FontWeight.bold,
                  color: AppColors.INCOMES_COLOR),
            ),
          ],
        ),
      ],
    );
  }
}
