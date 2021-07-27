import 'package:budget_planner/models/currency.dart';
import 'package:budget_planner/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/utils/size_config.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'budget_app_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  // final void Function() onTap;

  CurrencyItem({
    // required this.onTap,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: AlignmentDirectional.center,
        // color: Colors.red,
        margin: EdgeInsetsDirectional.only(
          top: SizeConfig().scaleHeight(24),
          bottom: SizeConfig().scaleHeight(24),
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
