import 'package:budget_planner/utils/app_colors.dart';
import 'package:budget_planner/widgets/budget_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final bool hasTrailing;
  final IconData trailingIcon;
  final IconData leadingIcon;
  final Color iconColor;
  final Color backgroundColor; // default white
  final Color? borderColor; // default white
  final Color textColor; // default white
  final String text;
  final Function() onTap;
  final bool hasBorder;

  SettingsCard({
    this.hasTrailing = false,
    this.hasBorder = false,
    this.trailingIcon = Icons.arrow_forward_ios,
    required this.leadingIcon,
    this.iconColor = AppColors.APP_DARK_PRIMARY_COLOR,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.textColor = AppColors.APP_DARK_PRIMARY_COLOR,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: hasBorder ? Border.all(color: borderColor!) : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.BOX_SHADOW_COLOR.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ]),
      child: ListTile(
        title: BudgetAppText(
          text: text,
          textColor: textColor,
          fontWeight: FontWeight.w500,
        ),
        leading: Icon(
          leadingIcon,
          color: iconColor,
        ),
        trailing: hasTrailing
            ? Icon(
                trailingIcon,
                color: iconColor,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
